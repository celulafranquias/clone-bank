<!-- Start XP Leftbar -->
  <div>
    <!-- Start XP Sidebar -->
    <div class="xp-sidebar">
      <!-- Start XP Logobar -->
      <div class="xp-logobar text-center">
        <a href="{{ route('home.index') }}" class="xp-logo"
          ><img src="{{ asset('assets/images/logo.png') }}" class="img-fluid" alt="logo"
        /></a>
      </div>
      <!-- End XP Logobar -->
      <!-- Start XP Navigationbar -->
      <div class="xp-navigationbar">
        <ul class="xp-vertical-menu">
          <li>
            <a href="/">
              <i class="icon-home"></i><span>Início</span>
            </a>
          </li>
          @can('realizar_venda')
          <li>
            <a href="javaScript:void();">
              <i class="icon-credit-card"></i><span>Pagar Contas</span
              ><i class="icon-arrow-right pull-right"></i>
            </a>
            <ul class="xp-vertical-submenu">
              @foreach($menus as $menu)
                <li><a href="/realizar-pagamento/{{$menu->id}}">{{$menu->name}}</a></li>
              @endforeach
            </ul>
          </li>
          @endcan
          @can('ver_venda')
          <li><a href="{{ route('vendedor.pagamentos') }}">Ver pagamentos</a></li>
          @endcan
          <li>
            <a href="{{ route('client.comprovante') }}">
              <i class="icon-magnifier"></i><span>Consultar Comprovantes</span>
            </a>
          </li>
          <li>
            <a href="javaScript:void();">
              <i class="icon-note"></i><span>Simular</span
              ><i class="icon-arrow-right pull-right"></i>
            </a>
            <ul class="xp-vertical-submenu">
              @foreach($menus as $menu)
                <li><a href="/simular-pagamento/{{$menu->id}}">{{$menu->name}}</a></li>
              @endforeach
            </ul>
          </li>
          @can('ver_menu_cliente')
         <li>
            <a href="javaScript:void();">
              <i class="icon-people"></i><span>Clientes</span
              ><i class="icon-arrow-right pull-right"></i>
            </a>
            <ul class="xp-vertical-submenu">
              <li><a href="{{ route('client.index') }}">Ver clientes</a></li>
              <li><a href="{{ route('client.create') }}">Cadastrar cliente</a></li>
            </ul>
          </li>
          @endcan
          @can('ver_menu_vendas')
          <li>
            <a href="javaScript:void();">
              <i class="icon-user-following"></i><span>Gerenciar</span
              ><i class="icon-arrow-right pull-right"></i>
            </a>
            <ul class="xp-vertical-submenu">
              <li><a href="{{ route('vendedor.gerarCodigo') }}">Gerar código de barras</a></li>
              <li><a href="{{ route('menu.index') }}">Meus menus</a></li>
              <li><a href="{{ route('menu-taxa.index') }}">Taxas de parcelamento</a></li>
            </ul>
          </li>
          @endcan
          @can('ver_menu_admin')
          <li>
            <a href="javaScript:void();">
              <i class="icon-wrench"></i><span>Admin</span
              ><i class="icon-arrow-right pull-right"></i>
            </a>
            <ul class="xp-vertical-submenu">
              @can('ver_vendedores')
              <li><a href="{{ route('vendedor.index') }}">Ver vendedores</a></li>
              @endcan
              @can('cadastrar_vendedores')
              <li><a href="{{ route('vendedor.create') }}">Cadastrar vendedor</a></li>
              @endcan
            </ul>
          </li>
          @endcan
        </ul>
      </div>
      <!-- End XP Navigationbar -->
    </div>
    <!-- End XP Sidebar -->
  </div>
  <!-- End XP Leftbar -->