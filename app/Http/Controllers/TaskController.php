<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreTaskRequest;
use App\Jobs\LogTaskJob;
use App\Models\Task;
use Illuminate\Http\JsonResponse;

class TaskController extends Controller
{
    public function index()
    {
        $tasks = Task::all();

        return response()->json($tasks, 200);
    }

    public function store(StoreTaskRequest $request)
    {
        $task = Task::create($request->validated());

        LogTaskJob::dispatch($task);

        return response()->json($task, 201);
    }
}
