# Laravel Task Manager API

A simple Laravel REST API to manage tasks, built for the developer test. It demonstrates:

-   Task creation and retrieval
-   Background job queue handling
-   Docker-based deployment

## Features

-   `POST /api/tasks`: Create a task with title, description, and status
-   `GET /api/tasks`: Fetch all tasks
-   `LogTaskJob`: Logs task info to `storage/logs/tasks.log` using Laravel queue

> ⚠️ **Authentication and security are NOT implemented.** This is a basic public API for testing purposes.

## Task Fields

| Field         | Type   | Required | Description                                           |
| ------------- | ------ | -------- | ----------------------------------------------------- |
| `title`       | string | Yes      | Max 255 characters                                    |
| `description` | text   | No       | Optional                                              |
| `status`      | string | Yes      | Must be one of: `pending`, `in-progress`, `completed` |

## Setup (Docker)

1. Copy `.env.example` to `.env` and update database/queue settings if needed.
2. Run the containers:

```bash
make up
```

3. Access the API at: http://localhost:8000

## Run Migrations

Enter the app container and run migrations:

```bash
make shell
php artisan migrate
```

## Example Request

```bash
POST /api/tasks
Content-Type: application/json

{
  "title": "Test task",
  "description": "Optional text",
  "status": "pending"
}
```

## Endpoints

| Method | Endpoint   | Description       |
| ------ | ---------- | ----------------- |
| POST   | /api/tasks | Create a new task |
| GET    | /api/tasks | Get all tasks     |

## Example Log Output

Log entries will be written to `storage/logs/tasks.log` by the queue worker:

## Queue Worker

This project uses Laravel’s **database queue**:

-   Ensure `.env` contains:

-   The queue container automatically runs:

```bash
php artisan queue:work
```
