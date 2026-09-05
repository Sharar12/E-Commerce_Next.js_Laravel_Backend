<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\ProductChat;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class ProductChatController extends Controller
{
    /**
     * Get all chats/questions for a specific product (Public endpoint)
     */
    public function publicChats($productId)
    {
        $chats = ProductChat::with(['user:id,name,email', 'replier:id,name'])
            ->where('product_id', $productId)
            ->orderBy('created_at', 'desc')
            ->get();

        return response()->json([
            'status' => 200,
            'data' => $chats
        ]);
    }

    /**
     * Submit a customer question for a product (Public endpoint)
     */
    public function storePublicChat(Request $request, $productId)
    {
        $product = Product::find($productId);
        if (!$product) {
            return response()->json([
                'status' => 404,
                'message' => 'Product not found.'
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'question' => 'required|string|min:3|max:1000',
            'user_id' => 'required|exists:users,id',
            'customer_name' => 'nullable|string|max:255',
            'customer_email' => 'nullable|email|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
                'message' => 'You must be signed in to your account to submit questions.'
            ], 422);
        }

        $chat = ProductChat::create([
            'product_id' => $productId,
            'user_id' => $request->user_id,
            'customer_name' => $request->customer_name,
            'customer_email' => $request->customer_email,
            'question' => trim($request->question),
            'status' => 'pending',
        ]);

        $chat->load(['user:id,name,email']);

        return response()->json([
            'status' => 201,
            'message' => 'Your question has been submitted successfully! An atelier representative will reply shortly.',
            'data' => $chat
        ], 201);
    }

    /**
     * Get all customer chats for Admin Dashboard (Admin endpoint)
     */
    public function indexAdminChats(Request $request)
    {
        $query = ProductChat::with([
            'product' => function ($q) {
                $q->select('id', 'name', 'sku', 'base_price')->with('images');
            },
            'user:id,name,email',
            'replier:id,name,email'
        ]);

        // Filter by status (pending / replied)
        if ($request->has('status') && in_array($request->status, ['pending', 'replied'])) {
            $query->where('status', $request->status);
        }

        // Search by product name, customer name, email, or question content
        if ($request->has('search') && !empty($request->search)) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('question', 'LIKE', "%{$search}%")
                  ->orWhere('customer_name', 'LIKE', "%{$search}%")
                  ->orWhere('customer_email', 'LIKE', "%{$search}%")
                  ->orWhereHas('product', function ($pQ) use ($search) {
                      $pQ->where('name', 'LIKE', "%{$search}%")
                        ->orWhere('sku', 'LIKE', "%{$search}%");
                  })
                  ->orWhereHas('user', function ($uQ) use ($search) {
                      $uQ->where('name', 'LIKE', "%{$search}%")
                        ->orWhere('email', 'LIKE', "%{$search}%");
                  });
            });
        }

        $chats = $query->orderBy('created_at', 'desc')->get();

        // Calculate summary counters
        $totalChats = ProductChat::count();
        $pendingChats = ProductChat::where('status', 'pending')->count();
        $repliedChats = ProductChat::where('status', 'replied')->count();

        return response()->json([
            'status' => 200,
            'stats' => [
                'total' => $totalChats,
                'pending' => $pendingChats,
                'replied' => $repliedChats,
            ],
            'data' => $chats
        ]);
    }

    /**
     * Reply to a customer question (Admin endpoint)
     */
    public function replyAdminChat(Request $request, $id)
    {
        $chat = ProductChat::find($id);
        if (!$chat) {
            return response()->json([
                'status' => 404,
                'message' => 'Customer chat inquiry not found.'
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'reply' => 'required|string|min:2|max:2000',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
                'message' => $validator->errors()->first()
            ], 422);
        }

        $user = $request->user();

        $chat->update([
            'reply' => trim($request->reply),
            'status' => 'replied',
            'replied_by' => $user ? $user->id : null,
            'replied_at' => Carbon::now(),
        ]);

        $chat->load([
            'product' => function ($q) {
                $q->select('id', 'name', 'sku', 'base_price')->with('images');
            },
            'user:id,name,email',
            'replier:id,name,email'
        ]);

        return response()->json([
            'status' => 200,
            'message' => 'Response transmitted successfully to customer chat.',
            'data' => $chat
        ]);
    }

    /**
     * Delete a customer chat (Admin endpoint)
     */
    public function deleteAdminChat($id)
    {
        $chat = ProductChat::find($id);
        if (!$chat) {
            return response()->json([
                'status' => 404,
                'message' => 'Customer chat inquiry not found.'
            ], 404);
        }

        $chat->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Customer chat inquiry deleted successfully.'
        ]);
    }
}
