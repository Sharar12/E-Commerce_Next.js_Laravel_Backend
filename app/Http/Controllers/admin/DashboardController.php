<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Order;
use App\Models\User;
use App\Models\OrderItem;
use App\Models\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use Illuminate\Support\Facades\Cache;

class DashboardController extends Controller
{
    /**
     * 📊 Return aggregated dashboard statistics
     */
    public function stats(Request $request)
    {
        $data = Cache::remember('dashboard:stats', now()->addMinutes(5), function () {
            // Total counts
            $totalProducts = Product::count();
            $totalOrders   = Order::count();
            $totalUsers    = User::count();
            $totalRevenue  = Payment::where('status', 'success')->sum('amount');

            // Order status breakdown
            $ordersByStatus = Order::select('status', DB::raw('count(*) as count'))
                ->groupBy('status')
                ->pluck('count', 'status')
                ->toArray();

            // Ensure all statuses present even if zero
            $allStatuses = ['pending', 'paid', 'processing', 'shipped', 'delivered', 'cancelled'];
            foreach ($allStatuses as $s) {
                if (!isset($ordersByStatus[$s])) $ordersByStatus[$s] = 0;
            }

            // 1. Weekly revenue & orders (last 12 weeks)
            $weeklyRev = Payment::where('status', 'success')
                ->where('created_at', '>=', now()->subWeeks(12))
                ->select(
                    DB::raw("DATE_FORMAT(created_at, 'W%v %Y') as label"),
                    DB::raw("MIN(created_at) as min_date"),
                    DB::raw('SUM(amount) as revenue')
                )
                ->groupBy('label')
                ->orderBy('min_date')
                ->get()->keyBy('label');

            $weeklyOrd = Order::where('created_at', '>=', now()->subWeeks(12))
                ->select(
                    DB::raw("DATE_FORMAT(created_at, 'W%v %Y') as label"),
                    DB::raw("MIN(created_at) as min_date"),
                    DB::raw('count(*) as orders')
                )
                ->groupBy('label')
                ->orderBy('min_date')
                ->get()->keyBy('label');

            $weeklyChart = [];
            $allWeeklyKeys = $weeklyRev->keys()->merge($weeklyOrd->keys())->unique();
            foreach ($allWeeklyKeys as $key) {
                $weeklyChart[] = [
                    'label' => $key,
                    'revenue' => round((float)($weeklyRev[$key]->revenue ?? 0), 2),
                    'orders' => (int)($weeklyOrd[$key]->orders ?? 0),
                ];
            }

            // 2. Monthly revenue & orders (last 12 months)
            $monthlyRev = Payment::where('status', 'success')
                ->where('created_at', '>=', now()->subMonths(12))
                ->select(
                    DB::raw("DATE_FORMAT(created_at, '%b %Y') as label"),
                    DB::raw("DATE_FORMAT(created_at, '%Y-%m') as sort_key"),
                    DB::raw('SUM(amount) as revenue')
                )
                ->groupBy('label', 'sort_key')
                ->orderBy('sort_key')
                ->get()->keyBy('label');

            $monthlyOrd = Order::where('created_at', '>=', now()->subMonths(12))
                ->select(
                    DB::raw("DATE_FORMAT(created_at, '%b %Y') as label"),
                    DB::raw("DATE_FORMAT(created_at, '%Y-%m') as sort_key"),
                    DB::raw('count(*) as orders')
                )
                ->groupBy('label', 'sort_key')
                ->orderBy('sort_key')
                ->get()->keyBy('label');

            $monthlyChart = [];
            $allMonthlyKeys = $monthlyRev->keys()->merge($monthlyOrd->keys())->unique();
            foreach ($allMonthlyKeys as $key) {
                $monthlyChart[] = [
                    'label' => $key,
                    'revenue' => round((float)($monthlyRev[$key]->revenue ?? 0), 2),
                    'orders' => (int)($monthlyOrd[$key]->orders ?? 0),
                ];
            }

            // 3. Yearly revenue & orders (last 5 years)
            $yearlyRev = Payment::where('status', 'success')
                ->where('created_at', '>=', now()->subYears(5))
                ->select(
                    DB::raw("DATE_FORMAT(created_at, '%Y') as label"),
                    DB::raw('SUM(amount) as revenue')
                )
                ->groupBy('label')
                ->orderBy('label')
                ->get()->keyBy('label');

            $yearlyOrd = Order::where('created_at', '>=', now()->subYears(5))
                ->select(
                    DB::raw("DATE_FORMAT(created_at, '%Y') as label"),
                    DB::raw('count(*) as orders')
                )
                ->groupBy('label')
                ->orderBy('label')
                ->get()->keyBy('label');

            $yearlyChart = [];
            $allYearlyKeys = $yearlyRev->keys()->merge($yearlyOrd->keys())->unique();
            foreach ($allYearlyKeys as $key) {
                $yearlyChart[] = [
                    'label' => $key,
                    'revenue' => round((float)($yearlyRev[$key]->revenue ?? 0), 2),
                    'orders' => (int)($yearlyOrd[$key]->orders ?? 0),
                ];
            }

            // Top 5 products by order quantity
            $topProducts = OrderItem::select(
                    'product_id',
                    DB::raw('SUM(quantity) as total_qty'),
                    DB::raw('SUM(price_at_purchase * quantity) as total_revenue')
                )
                ->with('product:id,name')
                ->groupBy('product_id')
                ->orderByDesc('total_qty')
                ->take(5)
                ->get()
                ->toArray();

            // Recent orders (last 10)
            $recentOrders = Order::with('user:id,name')
                ->latest()
                ->take(10)
                ->get()
                ->toArray();

            return [
                'metrics' => [
                    'total_products' => $totalProducts,
                    'total_orders'   => $totalOrders,
                    'total_users'    => $totalUsers,
                    'total_revenue'  => round($totalRevenue, 2),
                ],
                'orders_by_status' => $ordersByStatus,
                'weekly_chart'     => $weeklyChart,
                'monthly_chart'    => $monthlyChart,
                'yearly_chart'     => $yearlyChart,
                'monthly_revenue'  => array_map(fn($item) => ['month' => $item['label'], 'revenue' => $item['revenue']], $monthlyChart),
                'monthly_orders'   => array_map(fn($item) => ['month' => $item['label'], 'orders' => $item['orders']], $monthlyChart),
                'top_products'     => $topProducts,
                'recent_orders'    => $recentOrders,
            ];
        });

        return response()->json([
            'status' => 200,
            'data' => $data,
            'message' => 'Dashboard statistics retrieved successfully',
        ], 200);
    }
}
