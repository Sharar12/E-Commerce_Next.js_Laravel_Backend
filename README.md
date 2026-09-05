# E-Commerce Next.js + Laravel — Backend

The Laravel backend for the **E-Commerce Next.js + Laravel** application. This repository provides the server-side API, database access, authentication, business rules, and commerce services used by the corresponding Next.js frontend.

## Tech Stack

| Technology | Purpose |
| --- | --- |
| Laravel 12 | Backend/API framework |
| PHP 8.2+ | Server runtime |
| Laravel Sanctum | Token/API authentication |
| Eloquent ORM | Database access |
| Predis | Redis client integration |
| MySQL / relational database | Primary persistence |
| PHPUnit | Automated testing |
| Laravel Pint | Code formatting |

The project explicitly includes Laravel Sanctum and `predis/predis`, and its Composer scripts include local development and testing workflows.

## Responsibilities

- E-commerce API endpoints
- Authentication and authorization
- Products and categories
- Customer accounts
- Cart and checkout support
- Orders and commerce workflows
- Database persistence and migrations
- Backend validation and business logic
- Redis-backed infrastructure where configured

## Project Structure

```text
E-Commerce_Next.js_Laravel_Backend/
├── app/
│   ├── Console/
│   ├── Http/               # Controllers, middleware, requests
│   ├── Models/             # Eloquent models
│   └── Providers/          # Service providers
├── bootstrap/
├── config/
├── database/
│   ├── factories/
│   ├── migrations/
│   └── seeders/
├── public/
├── resources/
├── routes/
├── storage/
├── tests/
├── Backup_DB/
├── create_admin.php
├── create_customer.php
├── artisan
├── composer.json
├── .env.example
└── README.md
```

## Getting Started

### 1. Clone

```bash
git clone https://github.com/Sharar12/E-Commerce_Next.js_Laravel_Backend.git
cd E-Commerce_Next.js_Laravel_Backend
```

### 2. Install dependencies

```bash
composer install
```

### 3. Configure environment

```bash
cp .env.example .env
php artisan key:generate
```

Configure database, cache/Redis, mail, and any other service values required by the environment.

### 4. Run migrations

```bash
php artisan migrate
```

### 5. Start the backend

```bash
php artisan serve
```

The default local Laravel server uses port `8000` unless another port is configured.

## Useful Commands

```bash
php artisan serve
php artisan migrate
php artisan migrate:fresh
php artisan db:seed
php artisan route:list
php artisan optimize:clear
php artisan test
./vendor/bin/pint
```

The Composer configuration also provides a `composer dev` workflow and a test script.

## Frontend

Frontend repository:

```text
https://github.com/Sharar12/E-Commerce_Next.js_Laravel_Frontend
```

The Next.js application consumes this backend's API while handling the web UI and client-side experience.

## Security

- Keep `.env` and all credentials out of source control.
- Authenticate and authorize sensitive requests on the server.
- Validate all product, customer, cart, checkout, and order input server-side.
- Protect payment/order operations against unauthorized access.
- Use secure Redis/database credentials in production.

## License

This project is licensed under the license included in the repository.

<!-- README refresh: documentation-only change. -->
