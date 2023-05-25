<?php

$prefix = config('larapoll_config.prefix');
Route::group(['namespace' => 'Inani\Larapoll\Http\Controllers', 'prefix' => $prefix, 'middleware' => 'web'], function(){

    $middleware = config('larapoll_config.admin_auth');

    $guard = config('larapoll_config.admin_guard');
    Route::middleware('admin.user')->group(function () {
        Route::get('/adm', ['uses' => 'PollManagerController@home', 'as' => 'poll.home']);
        Route::get('/adm/polls', ['uses' => 'PollManagerController@index', 'as' => 'poll.index']);
        Route::get('/adm/polls/create', ['uses' => 'PollManagerController@create', 'as' => 'poll.create']);
        Route::get('/adm/polls/{poll}', ['uses' => 'PollManagerController@edit', 'as' => 'poll.edit']);
        Route::patch('/adm/polls/{poll}', ['uses' => 'PollManagerController@update', 'as' => 'poll.update']);
        Route::delete('/adm/polls/{poll}', ['uses' => 'PollManagerController@remove', 'as' => 'poll.remove']);
        Route::patch('/adm/polls/{poll}/lock', ['uses' => 'PollManagerController@lock', 'as' => 'poll.lock']);
        Route::patch('/adm/polls/{poll}/unlock', ['uses' => 'PollManagerController@unlock', 'as' => 'poll.unlock']);
        Route::post('/adm/polls', ['uses' => 'PollManagerController@store', 'as' => 'poll.store']);
        Route::get('/adm/polls/{poll}/options/add', ['uses' => 'OptionManagerController@push', 'as' => 'poll.options.push']);
        Route::post('/admin/polls/{poll}/options/add', ['uses' => 'OptionManagerController@add', 'as' => 'poll.options.add']);
        Route::get('/admin/polls/{poll}/options/remove', ['uses' => 'OptionManagerController@delete', 'as' => 'poll.options.remove']);
        Route::delete('/admin/polls/{poll}/options/remove', ['uses' => 'OptionManagerController@remove', 'as' => 'poll.options.remove']);
    });

    Route::post('/vote/polls/{poll}', 'VoteManagerController@vote')->name('poll.vote');
});
