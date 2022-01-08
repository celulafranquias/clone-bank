<x-app-layout>
    <x-breadcrumb-bar :pag="$pag" :link="$link" />
    <div class="xp-contentbar">
        <div class="col-lg-12">
            <div class="card m-b-30">
                <div class="card-header bg-white">
                    <h5 class="card-title text-black">Olá, {{ auth()->user()->name }}</h5>
                    <h6 class="card-subtitle">Para o cadastro do novo <code class="highlighter-rouge">cliente,</code>
                        preencha todos os campos abaixo <code class="highlighter-rouge">corretamente</code>.</h6>
                </div>

                <x-form-user :btn="$btn" :act="$act" :type="$type" />

            </div>
        </div>
    </div>
    @section('additional_scripts')
        <script type="text/javascript" src="https://unpkg.com/webcam-easy/dist/webcam-easy.min.js"></script>
        <script type="text/javascript">
            var webcam;
            $('.take-photo-modal').on('shown.bs.modal', function(e) {
                const webcamElement = document.querySelector('#webcam');
                const canvasElement = document.querySelector('#webcam-canvas');
                const webcamAudio = document.querySelector('#webcamSound');
                webcam = new Webcam(webcamElement, 'user', canvasElement, webcamAudio);

                webcam.start().then(result => {
                    console.log('Webcam Started')
                }).catch(err => {
                    console.log(err)
                })
            })

            $('.take-photo-modal').on('hidden.bs.modal', function(e) {
                if (webcam) {
                    webcam.stop();
                }
            })

            $('#take-photo-btn').click(function(e) {
              if (!webcam) return;
              
              const photo = webcam.snap();
              const photoEl = $('#photo');
              const photoInputEl = $('[name="image"]')

              photoEl.removeClass('d-none');
              photoEl.attr('src', photo);
              photoInputEl.val(photo);
              $('.take-photo-modal').modal('hide');
            })
        </script>
    @endsection
</x-app-layout>
