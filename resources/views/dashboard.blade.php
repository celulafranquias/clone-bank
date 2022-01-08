<x-app-layout>
    <x-breadcrumb-bar :pag="$pag" :link="$link" />
    <div class="xp-contentbar">
        <div class="row">
            <!-- Start XP Col -->
            <div class="col-md-12 col-lg-12 col-xl-7">

                <!-- Start XP Row -->
                <div class="row">
                    <!-- Start XP Col -->
                    <div class="col-md-12 col-lg-12 col-xl-12">
                        <div style="height: 500px;" class="card m-b-30">
                            <div class="card-header bg-white">
                                <h5 class="card-title text-black mb-0">Receita semanal</h5>
                            </div>
                            <div class="card-body">
                                <div class="xp-chart-label">
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <p class="text-black">Semana atual</p>
                                            <h4 class="text-primary-gradient mb-3"><i class="icon-wallet mr-2"></i>R$
                                                {{ $currentWeekIncome }}</h4>
                                        </li>
                                        <li class="list-inline-item">
                                            <p class="text-black">Semana anterior</p>
                                            <h4 class="text-success-gradient mb-3"><i class="icon-wallet mr-2"></i>R$
                                                {{ $previousWeekIncome }}</h4>
                                        </li>
                                    </ul>
                                </div>
                                <div id="price-chart"
                                    class="ct-chart ct-golden-section xp-chartist-simple-line"></div>
                            </div>
                        </div>
                    </div>
                    <!-- End XP Col -->
                </div>
                <!-- End XP Row -->

            </div>
            <!-- End XP Col -->

            <!-- Start XP Col -->
            <div class="col-md-12 col-lg-12 col-xl-5">
                <div class="row">
                    <!-- Start XP Col -->
                    <div class="col-md-12 col-lg-12 col-xl-12">
                        <div class="card bg-primary-gradient m-b-30">
                            <div class="card-body">
                                <div class="xp-widget-box text-white">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-5 align-self-center">
                                            <p class="xp-icon-timer mb-5"><i class="icon-hourglass"></i></p>
                                            <h4 class="mb-0 font-26">5.3 hrs</h4>
                                            <p class="mb-2">Média de sessões de membros</p>
                                            <p class="mb-0"><span class="f-w-7">+18.68%</span> <span
                                                    class="font-12">vs nos últimos 7 dias</span></p>
                                        </div>
                                        <div class="col-md-6 col-lg-7">
                                            <div id="xp-chartist-widget-bar"
                                                class="ct-chart ct-golden-section xp-chartist-label-placement xp-chartist-widget-color">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End XP Col -->

                    <!-- Start XP Col -->
                    <div class="col-md-12 col-lg-12 col-xl-12">
                        <div class="card bg-success-gradient m-b-30">
                            <div class="card-body">
                                <div class="xp-widget-box text-white text-center pt-3">
                                    <p class="xp-icon-timer mb-4"><i class="icon-trophy"></i></p>
                                    <h4 class="mb-2 font-20">Parabéns, {{ auth()->user()->name }}!</h4>
                                    <p class="mb-3">Bem-vindo a bordo. Obrigado por se juntar à nossa equipe.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End XP Col -->
                </div>
            </div>
            <!-- End XP Col -->

        </div>
    </div>
    @section('additional_scripts')
        <script>
            const paymentData = JSON.parse('@json($paymentData)');
            console.log(paymentData);
            new Chartist.Line('#price-chart', {
                // A labels array that can contain any sort of values
                labels: Object.keys(paymentData).reverse(),
                // Our series array that contains series objects or in this case series data arrays
                series: [
                    Object.values(paymentData).reverse()
                ]
            })
        </script>
    @endsection
</x-app-layout>
