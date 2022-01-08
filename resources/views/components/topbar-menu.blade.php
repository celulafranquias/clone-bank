 <div>
     <div class="row">
         <div class="col-2 col-md-1 col-lg-1 order-2 order-md-1 align-self-center">
             <div class="xp-menubar">
                 <a class="xp-menu-hamburger" href="javascript:void();">
                     <i class="icon-menu font-20 text-white"></i>
                 </a>
             </div>
         </div>
         <div class="col-10 col-md-11 col-lg-11 order-1 order-md-2">
             <div class="xp-profilebar text-right">
                 <ul class="list-inline mb-0">
                     @if (auth()->user()->isAdmin())

                         <li class="list-inline-item">
                             <div class="dropdown xp-notification">
                                 <a class="dropdown-toggle text-white" href="#" role="button" id="xp-notification"
                                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                     <i class="icon-bell font-18 v-a-m"></i>
                                     <span
                                         class="badge badge-pill bg-danger-gradient xp-badge-up notification-count">{{ $notifications->count() }}</span>
                                 </a>

                                 <div class="dropdown-menu dropdown-menu-right" aria-labelledby="xp-notification">
                                     <ul class="list-unstyled">
                                         <li class="media">
                                             <div class="media-body">
                                                 <h5 class="mt-0 mb-0 py-3 text-white text-center font-16">
                                                     <span
                                                         class="notification-count">{{ $notifications->count() }}</span>
                                                     Novas
                                                     Notificações
                                                 </h5>
                                             </div>
                                         </li>
                                         <div class="notification-list">
                                             @foreach ($notifications as $notification)
                                                 <li class="media xp-noti" style="background-image: none;">
                                                     <div class="mr-3 xp-noti-icon success-rgba"><i
                                                             class="icon-basket-loaded text-success"></i></div>
                                                     <div class="media-body">
                                                         <a href="#">
                                                             <h5 class="mt-0 mb-1 font-14">Pagamento feito pelo cliente
                                                                 {{ $notification->ticket->client->name }}
                                                             </h5>
                                                             <p class="mb-0 font-12 f-w-4">
                                                                 {{ date('d/m/Y H:i', strtotime($notification->ticket->created_at)) }}
                                                             </p>
                                                         </a>
                                                     </div>
                                                 </li>
                                             @endforeach
                                         </div>

                     @endif

                 </ul>
             </div>
         </div>
         </li>
         <li class="list-inline-item mr-0">
             <div class="dropdown xp-userprofile">
                 <a class="dropdown-toggle" href="#" role="button" id="xp-userprofile" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false"><img src="{{ auth()->user()->profile_photo_url }}"
                         alt="user-profile" class="rounded-circle img-fluid"><span class="xp-user-live"></span></a>

                 <div class="dropdown-menu dropdown-menu-right" aria-labelledby="xp-userprofile">
                     <a class="dropdown-item py-3 text-white text-center font-16" href="#">Bem
                         vindo(a)<br>{{ auth()->user()->name }}</a>
                     <a class="dropdown-item" href="{{ route('user.dados') }}"><i
                             class="icon-user text-primary mr-2"></i> Meus Dados</a>
                     <a class="dropdown-item" href="{{ route('client.comprovante') }}"><i
                             class="icon-wallet text-success mr-2"></i> Meus Boletos</a>
                     <form method="POST" action="{{ route('logout') }}">
                         @csrf
                         <button class="dropdown-item" type="submit"><i class="icon-power text-danger mr-2"></i>
                             Sair</button>
                     </form>
                 </div>
             </div>
         </li>

         </ul>
     </div>
 </div>
 </div>
 </div>
 @section('additional_scripts')

     <script>
         const baseUrl = '{{ env('APP_URL') }}';
         setInterval(() => {
             const currentNotificationLength = $('.notification-count').html();
             $.get(baseUrl + '/notifications', function({ data }) {
                 const notificationLength = data.length;
                 if (notificationLength == currentNotificationLength) return;

                 $('.notification-count').html(notificationLength);
                 $('.notification-list').empty();
                 data.forEach(notification => {
                     $('.notification-list').append(`
                    <li class="media xp-noti" style="background-image: none;">
                            <div class="mr-3 xp-noti-icon success-rgba"><i
                                    class="icon-basket-loaded text-success"></i></div>
                            <div class="media-body">
                                <a href="#">
                                    <h5 class="mt-0 mb-1 font-14">Pagamento feito pelo cliente
                                        ${notification.clientName}
                                    </h5>
                                    <p class="mb-0 font-12 f-w-4">
                                    ${formatDate(new Date(notification.created_at))}
                                    </p>
                                </a>
                            </div>
                    </li>
                    `)
                 })

             });
         }, 1000);

         function formatDate(date) {
             const year = date.getFullYear();
             const month = date.getMonth().toString().length === 1 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1;
             const day = date.getDay().toString().length === 1 ? '0' + date.getDay() : date.getDay();

             const hour = date.getHours().toString().length === 1 ? '0' + date.getHours() : date.getHours();
             const minutes = date.getMinutes().toString().length === 1 ? '0' + date.getMinutes() : date.getMinutes();

             return `${day}/${month}/${year} ${hour}:${minutes}`;
         }
     </script>

 @endsection
