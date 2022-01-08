<x-app-layout>
    <x-breadcrumb-bar :pag="$pag" :link="$link" />
    <div class="xp-contentbar">
        <x-bank :bank="$bank" :taxas="$taxas" :saveBtn="$saveBtn"/>
    </div>
  </x-app-layout>
  