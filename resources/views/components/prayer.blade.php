<!-- Prayer Widget -->

<div class="widget-title Title24 green-title">{{ __('libelle.prayer-time') }}</div>
<!-- CITY SELECTION-->
@if($locale=="ar")
<select class="form-control mt10" id="GovList">
    @foreach ($listgov as $gov)
    <option value="{{$gov->id}}">{{$gov->libelle_ar}}</option>
    @endforeach
</select>
@else
<select class="form-control mt10" id="GovList">
    @foreach ($listgov as $gov)
    <option value="{{$gov->id}}">{{$gov->libelle}}</option>
    @endforeach
</select>
@endif
<!-- /. CITY SELECTION-->
<div class="pray-times-content mt10">
    <h5>{{ __('libelle.prayer-time-gov') }}:  
        <span style="color: #349667;"> 
        {{ Alkoumi\LaravelHijriDate\Hijri::Date(' j F ، Y',$locale)}}
        </span>
    </h5>
    
    <ul class="mt10">
        <!-- TIMES -->
        <div class="single-time clearfix g-border-b">
            <div class="pull-right">
                <img data-src="{{$public_url}}/img/pray/beach-sunset.png" alt="sunrise" class="ml10 lazyload">
                <label>{{ __('libelle.alfajr') }}</label>
            </div>
            <div class="pull-left tm" id="T_fajr"></div>
        </div>
        <!-- /. TIMES -->
        <!-- TIMES -->
        <div class="single-time  clearfix g-border-b">
            <div class="pull-right"><img data-src="{{$public_url}}/img/pray/meteorology.png" alt="sunrise"
                    class="ml10 lazyload"><label>{{ __('libelle.aldohr') }}</label>
            </div>
            <div class="pull-left tm" id="T_Dohr"></div>
        </div>
        <!-- /. TIMES -->
        <!-- TIMES -->
        <div class="single-time clearfix g-border-b">
            <div class="pull-right"><img data-src="{{$public_url}}/img/pray/meteorology.png" alt="sunrise"
                    class="ml10 lazyload"><label>{{ __('libelle.alasr') }}</label>
            </div>
            <div class="pull-left tm" id="T_Asr"></div>
        </div>
        <!-- /. TIMES -->
        <!-- TIMES -->
        <div class="single-time  clearfix g-border-b">
            <div class="pull-right"><img data-src="{{$public_url}}/img/pray/miscellaneous.png" alt="sunrise"
                    class="ml10 lazyload"><label>{{ __('libelle.almaghreb') }}</label></div>
            <div class="pull-left tm" id="T_Maghrib"></div>
        </div>
        <!-- /. TIMES -->
        <!-- TIMES -->
        <div class="single-time  clearfix g-border-b">
            <div class="pull-right"><img data-src="{{$public_url}}/img/pray/miscellaneous.png" alt="sunrise"
                    class="ml10 lazyload"><label>{{ __('libelle.alisha') }}</label></div>
            <div class="pull-left tm" id="T_Isha"></div>
        </div>
        <!-- /. TIMES -->
    </ul>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> <!-- jQuery CDN -->
<script type='text/javascript'>
    $( document ).ready(function(){
        var id_selected=document.getElementById("GovList").value;
        $.ajax({
            url: '{{$public_url}}/getData/'+id_selected,
            type: 'get',
            dataType: 'json',
            success: function(response){
            // Empty <tbody>
                if(response['data'] != null){
                $("#T_fajr").html(response['data'].T_fajr);
                $("#T_Dohr").html(response['data'].T_Dohr);
                 $("#T_Asr").html(response['data'].T_Asr);
                $("#T_Maghrib").html(response['data'].T_Maghrib);
                $("#T_Isha").html(response['data'].T_Isha);
                }
                }
                });
       // Fetch all records
       $('select').on('change',function(){
           var id =document.getElementById("GovList").value;
              GetPrayerTime(id);
       });
     });
     function GetPrayerTime(id){
       $.ajax({
         url: '{{$public_url}}/getData/'+id,
         type: 'get',
         dataType: 'json',
         success: function(response){
 // Empty <tbody>
          if(response['data'] != null){
              $("#T_fajr").html(response['data'].T_fajr);
              $("#T_Dohr").html(response['data'].T_Dohr);
              $("#T_Asr").html(response['data'].T_Asr);
              $("#T_Maghrib").html(response['data'].T_Maghrib);
              $("#T_Isha").html(response['data'].T_Isha);
           }
         }
       });
     }
</script>
