@extends('layout.layout')
@section('SEO')
@component('components.seo')
@slot('mode')
1
@endslot
@endcomponent
@endsection
@section('title')
{{ __('routes.contact') }}
@endsection
@section('head-scripts')
@php
if ($locale =='ar') $styleMenu = 'StyleMenuAR.css'; else $styleMenu = 'StyleMenu.css';
@endphp
<link rel="stylesheet" type="text/css" href={{ asset("css/{$styleMenu }") }}>
@endsection
@php
$urlName[0] = __('routes.contact');
$IsActive[0] ='active';
$urlBread[0] ='/contact';
@endphp
@section('content')
@include('layout.partials.breadcrumb',['count' => 1,
'urlbread' => $urlBread,
'urlName' => $urlName,
'IsActive' => $IsActive
])

<div class="contact-body ">
    <div class="container">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <!-- contact CONTENT AREA -->
            <div class="contact-content-area mt50">
                <div class="col-md-4">
                    <ul class="mt10">
                        <li>
                            <div class="media">
                                <div class="media-left">
                                    <i class="fa fa-home"></i>

                                </div>
                                <div class="media-body">
                                    <h5>{{ __('libelle.Adresse') }} :</h5>
                                    <p>{{ setting('site.site_adresse_ar') }}</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="media">
                                <div class="media-left">
                                    <i class="fa fa-phone"></i>

                                </div>
                                <div class="media-body">
                                    <h5>{{ __('libelle.Telephone') }} :</h5>
                                    <p>{{setting('site.site_tel')}}</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="media">
                                <div class="media-left">
                                    <i class="fa fa-fax"></i>

                                </div>
                                <div class="media-body">
                                    <h5>{{ __('libelle.Fax') }} :</h5>
                                    <p>{{setting('site.site_fax')}}</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="media">
                                <div class="media-left">
                                    <i class="fa fa-envelope"></i>
                                </div>
                                <div class="media-body">
                                    <h5>{{ __('libelle.Email') }} :</h5>
                                    <p>{{ setting('site.site_email') }}</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="col-md-8">
                    <div class="contact-info">
                        <div class="info-icon bg-dark">
                            <i class="fa fa-pencil"></i>
                        </div>
                        <form method="post" action="{{ route('contact.front') }}" autocomplete="off">
                            @csrf
                            <!-- Field 1 -->
                            <div class="input-text form-group">
                                <input type="text" name="contact_name" class="input-name form-control"
                                    placeholder="الأسم و اللقب">
                            </div>
                            <!-- Field 2 -->
                            <div class="input-email form-group">
                                <input type="email" name="contact_email" class="input-email form-control"
                                    placeholder="البريد الإلكتروني">
                            </div>

                            <!-- Field 4 -->
                            <div class="textarea-message form-group">
                                <textarea name="contact_message" class="textarea-message form-control"
                                    placeholder="مضمون الرسالة" rows="9"></textarea>
                            </div>
                            <!-- Button -->
                            <button class="btn pull-left yellow-btn" type="submit">ارسل</button>
                        </form>
                    </div>
                </div>

            </div>
            <!-- Row -->
        </div>
        <!-- /. MAIN CONTENT -->
    </div>
    <!-- /.ADMIN PAGE -->

    <!-- FOOTER -->
    @include('layout.partials.footer')


    <!-- /. FOOTER -->
</div>


@endsection

@section('scripts-contents')
@endsection
