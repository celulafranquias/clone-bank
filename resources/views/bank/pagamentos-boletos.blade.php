<x-app-layout>
  <x-breadcrumb-bar :pag="$pag" :link="$link" />
  <div class="xp-contentbar">
      <x-bank :bank="$bank" :taxas="$taxas"/>
  </div>
</x-app-layout>
