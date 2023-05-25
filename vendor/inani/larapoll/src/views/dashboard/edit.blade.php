@extends('larapoll::layouts.app')
@section('title')
Polls- Editer
@endsection
@section('style')
<style>
    .clearfix {
        clear: both;
    }

    .create-btn {
        display: block;
        width: 16%;
        float: right;
    }

    .old_options,
    .options,
    .button-add {
        list-style-type: none;
    }

    .add-input {
        width: 80%;
        display: inline-block;
        margin-right: 10px;
        margin-bottom: 10px;
    }
</style>
@endsection
@section('content')
<div class="container">
    <ol class="breadcrumb">
        <li><a href="{{ route('poll.home') }}">Accueil</a></li>
        <li><a href="{{ route('poll.index') }}">Polls</a></li>
        <li class="active">Editer Poll</li>
    </ol>
    <div class="well col-md-8 col-md-offset-2">
        @if($errors->any())
        <ul class="alert alert-danger">
            @foreach($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
        @endif
        <form method="POST" action=" {{ route('poll.update', $poll->id) }}">
            {{ csrf_field() }}
            @method('patch')
            <div class="form-group">
                <label>Question: </label>
                <textarea id="question" name="question" cols="30" rows="2" class="form-control" placeholder="Question Ar / Question Fr / Question En">{{ old('question', $poll->question) }}</textarea>
            </div>
            <div class="form-group">
                <label>Options</label>
                <ul class="options">
                    @foreach($poll->options as $option)
                    <li>
                        <input class="form-control add-input" value="{{ $option->name }}" disabled />
                    </li>
                    @endforeach
                </ul>
            </div>
            <div class="form-group">
                <label>Nombre d'options à sélectionner</label>
                <select name="count_check" class="form-control">
                    @foreach(range(1, $poll->optionsNumber()) as $i)
                    <option {{ $i==$poll->maxCheck? 'selected':'' }}>{{ $i }}</option>
                    @endforeach
                </select>
            </div>

            <div class="form-group clearfix">
                <label>Options</label>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="starts_at">Date de début : </label>
                        <input type="datetime-local" id="starts_at" name="starts_at" class="form-control" value="{{ old('starts_at', \Carbon\Carbon::parse($poll->starts_at)->format('Y-m-d\TH:i')) }}" />
                    </div>

                    <div class="form-group col-md-6">
                        <label for="starts_at">Date de fin</label>
                        <input type="datetime-local" id="ends_at" name="ends_at" class="form-control" value="{{ old('ends_at', \Carbon\Carbon::parse($poll->ends_at)->format('Y-m-d\TH:i')) }}" />
                    </div>
                </div>
            </div>

            <div class="radio">
                <div class="form-group">
                    <label>
                        <input hidden type="checkbox" name="canVisitorsVote" value="1" checked> 
                    </label>
                </div>
                <div class="form-group">
                    <label>
                        <input type="checkbox" name="close" {{ old('close', $poll->isLocked()) ? 'checked':'' }}> Metter fin pour le vote
                    </label>
                </div>
                <div class="form-group">
                    <label>
                        <input hidden type="checkbox" name="canVoterSeeResult" value="1" checked> 
                    </label>
                </div>
            </div>

            <!-- Create Form Submit -->
            <div class="form-group">
                <input name="update" type="submit" value="Update" class="btn btn-primary create-btn" />
            </div>
        </form>
    </div>
</div>
@endsection