<?php

namespace Inani\Larapoll\Http\Controllers;

use App\Http\Controllers\Controller;
use Exception;
use Illuminate\Http\Request;
use Inani\Larapoll\Guest;
use Inani\Larapoll\Poll;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class VoteManagerController extends Controller
{
    /**
     * Make a Vote
     *
     * @param Poll $poll
     * @param Request $request
     * @return $this|\Illuminate\Http\RedirectResponse
     */
    public function vote(Poll $poll, Request $request)
    {

        switch ($request->session()->get('locale')) {
            
            case 'ar':
                $msg ="شكرا لتصويتكم";
                break;

            case 'fr':
                $msg ="Merci pour le vote";
                break;
            case 'en':
                $msg ="Thanks for voting";
                break;

        }

        try {
            //dd($locale);
            $vote = $this->resolveVoter($request, $poll)
                ->poll($poll)
                ->vote($request->get('options'));

            if ($vote) {

                return back()->with('success', $msg);
            }
        } catch (Exception $e) {
            return back()->with('errors', $e->getMessage());
        }
    }

    /**
     * Get the instance of the voter
     *
     * @param Request $request
     * @param Poll $poll
     * @return Guest|mixed
     */
    protected function resolveVoter(Request $request, Poll $poll)
    {
        if ($poll->canGuestVote()) {
            return new Guest($request);
        }
        return $request->user(config('larapoll_config.admin_guard'));
    }
}
