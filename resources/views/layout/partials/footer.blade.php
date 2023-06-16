<footer class="mt50 clearfix">
    <div class="container">
        <div class="row">
            <!---->
            <div class="footer-links col-md-3 col-xs-12">
                <h3>{{ __('libelle.siteUtiles') }}</h3>
                <ul class="mt20">
                    @foreach ($listLiensUtile as $lien)
                    <li><a href="{{ $lien->lien }}" target="{{ $lien->nv_onglet }}">{{ $lien->$titre }}</a></li>
                    @endforeach
                </ul>
            </div>
            <!---->
            <!---->
            <div class=" col-md-3 col-xs-12">
                <h3>{{ __('libelle.NewsLetter') }}</h3>
                <form class="form-inline mt20" action="" method="POST">
                    @if($errors->any())
                    <div class="alert alert-warning alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h5><i class="icon fa fa-warning"></i> تنبيه!</h5>
                        @foreach ($errors->all() as $error)
                        <p>{{$error}}</p>
                        @endforeach
                    </div>
                    @endif
                    @csrf
                    <div class="form-group" style="padding-bottom: 10px;">
                        <input type="email" class="form-control" id="email" name="email"
                            placeholder="{{ __('libelle.EmailPlaceHolder') }}" autocomplete="off">
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12" style="padding-bottom: 10px;">
                            <div class="captcha">
                                <span>{!! Captcha::img('flat') !!}</span>
                            </div>
                        </div>
                        <div class="form-group col-md-4" style="padding-bottom: 10px;">
                            <input id="captcha" type="text" class="form-control" placeholder="ادخل الرمز" name="captcha"
                                required autocomplete="off">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-default">{{ __('button.Subscription') }}</button>
                </form>
                <!-- SOCIAL MEDIA -->
                <div class="footer-social-media">
                    <ul class="mt10">
                        <li><a href="{{ setting('site.site_facebook') }}" target="_blank"><i
                                    class="fa fa-facebook"></i></a></li>
                    </ul>
                </div>
                <!--/. SOCIAL MEDIA -->
            </div>
            <!---->
            @php
            switch ($locale) {
            case "en":
            # code...
            $contactNous= 'Contact Us';
            $adresseSite = 'Adrress : '.setting('site.site_adresse_en');
            $tel = 'Tel : ';
            $fax = 'Fax : ';
            $email = 'Email : ';
            $gelocal = 'Geolocalisation';
            break;
            case "fr":
            $contactNous= 'Contactez-Nous';
            $adresseSite = 'Adresse : '.setting('site.site_adresse_fr');
            $tel = 'Tél : ';
            $fax = 'Fax : ';
            $email = 'Email : ';
            $gelocal = 'Rendez-nous visite';
            break;
            case "ar":
            $contactNous= 'للإتصال بنا';
            $adresseSite = 'العنوان : '.setting('site.site_adresse_ar');
            $tel = 'الهاتف : ';
            $fax = 'الفاكس : ';
            $email = 'البريد الإلكتروني : ';
            $gelocal = 'موقعنا على الخريطة';
            break;
            }
            @endphp
            <!--CONTACTEZ NOUS-->
            <div class="footer-media col-md-3 col-xs-12">
                <h3> {{ $contactNous }} </h3>
                <div class="col-md-12 col-xs-12">
                    <div class="mt20">
                        <ul class="mt10">
                            <li>
                                {{ $adresseSite }}
                            </li>
                            <li>
                                {{ $tel }}{{ setting('site.site_tel') }}
                            </li>
                            <li>
                                {{ $fax }} {{ setting('site.site_fax') }}
                            </li>
                            <li>
                                {{ $email }} {{  setting('site.site_email') }}
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!---->
            <!--VOTE-->
            <div class="footer-media col-md-3 col-xs-12">
                <h3>{{ $gelocal }}</h3>
                <div class="col-md-12 col-xs-12">
                    <div class="mt20">
                        <div class="widget-content">
                            <!-- VOTING CONTENT -->
                            <iframe width="230" height="250" frameborder="0" style="border:0"
                                src="https://www.google.com/maps/embed/v1/place?q=Commune%20Aousja%20Tunisie&key=AIzaSyAjSzX-q8payJNJmMKaI2zhiKXU6p6IrXI"
                                allowfullscreen></iframe>
                        </div>
                    </div>


                </div>
            </div>

        </div>
        <!---->
    </div>
    </div>
</footer>
<!-- /. FOOTER -->
</article>
<!-- FOOTER BOTTOM -->
<div class="footer-bottom">
    <div class="container">
        <div class="row">
            <!--COPYRIGHTS -->
            <div class="col-md-8">
                <div class="copyright">{{ __('libelle.Copyright') }}</div>
            </div>
            <!--/. COPYRIGHTS -->
        </div>
    </div>
</div>

<!-- Javascript FILES AND LIBS -->
<script src="{{ asset('js/jquery-1.11.3.min.js')}}"></script>
<script src="{{ asset('js/bootstrap.min.js')}}"></script>
<script src="{{ asset('js/wow.min.js')}}"></script>
<script src="{{ asset('js/lazysizes.min.js')}}"></script>
<!--<script src="js/owl.carousel.min.js"></script>-->
<script src="{{ asset('js/vue.js')}}"></script>
<script src="{{ asset('js/axios.min.js')}}"></script>
<script>
    window.laravel = {!! json_encode(['csrfToken' => csrf_token(), 'url' =>url('/')]) !!};
</script>
<script>
    var apps = new Vue({
                el:'#topheader',
                data: {
                    liensHeader : []

                },
                methods : {
                    getAllLiensHeader : function(){
                        axios.get(window.laravel.url +'/getAllLiensHeader')
                             .then((repsonse) => {
                                 this.liensHeader = repsonse.data
                             })
                             .catch((error) => {
                                 console.log(error)
                             })
                    }
                },
                mounted: function(){
                    this.getAllLiensHeader()
                }
    });

</script>
