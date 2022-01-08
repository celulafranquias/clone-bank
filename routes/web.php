<?php

use App\Http\Controllers\BankController;
use App\Http\Controllers\ClientsController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MenusController;
use App\Http\Controllers\MenuTaxasController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\VendedorController;
use App\Models\Notification;
use Illuminate\Support\Facades\Route;

Route::middleware(['auth:sanctum', 'verified'])->group( function () {
    Route::get('/', [HomeController::class, 'index'])->name('home.index');
    Route::get('/simular-pagamento/{id}', [HomeController::class, 'bankSimulate'])->name('home.bankSimulate');
    Route::get('/buscar-user/{cpf}', [HomeController::class, 'userSearch'])->name('home.userSearch');
    Route::get('/buscar-percentage/{type}/{id}', [HomeController::class, 'percentageSearch'])->name('home.percentageSearch');

    Route::get('/meus-menus', [MenusController::class, 'index'])->name('menu.index');
    Route::get('/novo-menu', [MenusController::class, 'create'])->name('menu.create');
    Route::post('/novo-menu', [MenusController::class, 'store'])->name('menu.store');
    Route::post('/status-menu', [MenusController::class, 'statusMenu'])->name('menu.statusMenu');

    Route::get('/meus-menus-taxas', [MenuTaxasController::class, 'index'])->name('menu-taxa.index');
    Route::get('/novo-menu-taxa', [MenuTaxasController::class, 'create'])->name('menu-taxa.create');
    Route::post('/novo-menu-taxa', [MenuTaxasController::class, 'store'])->name('menu-taxa.store');

    Route::get('/ver-cliente/{id}', [ClientsController::class, 'show'])->name('client.show');
    Route::get('/clientes', [ClientsController::class, 'index'])->name('client.index');
    Route::get('/novo-cliente', [ClientsController::class, 'create'])->name('client.create');
    Route::get('/comprovante-de-pagamento', [ClientsController::class, 'comprovantePagamento'])->name('client.comprovante');
    Route::post('/satus-cliente', [ClientsController::class, 'satusClient'])->name('client.satus');
    Route::post('/novo-cliente', [ClientsController::class, 'store'])->name('client.store');

    Route::get('/meus-dados', [UserController::class, 'meusDados'])->name('user.dados');
    Route::post('/alterar-senha', [UserController::class, 'alterarSenha'])->name('user.alterarSenha');

    Route::get('/todos-pagamentos', [VendedorController::class, 'pagamentos'])->name('vendedor.pagamentos');
    Route::get('/inserir-comprovante/{id}', [VendedorController::class, 'comprovante'])->name('vendedor.comprovante');
    Route::post('/inserir-comprovante', [VendedorController::class, 'saveComprovante'])->name('vendedor.save.comprovante');
    Route::get('/gerar-codigos-de-barras', [VendedorController::class, 'gerarCodigo'])->name('vendedor.gerarCodigo');
    Route::post('/gerar-codigos-de-barras', [VendedorController::class, 'gerarCodigoFilter'])->name('vendedor.gerarCodigoFilter');
    Route::get('/vendedores', [VendedorController::class, 'index'])->name('vendedor.index');
    Route::get('/novo-vendedor', [VendedorController::class, 'create'])->name('vendedor.create');
    Route::post('/novo-vendedor', [VendedorController::class, 'store'])->name('vendedor.store');

    Route::get('/realizar-pagamento/{id}', [BankController::class, 'mainMenu'])->name('bank.mainMenu');
    Route::post('/save-pagamento/{id}', [BankController::class, 'sendBank'])->name('bank.sendBank');
    Route::post('/status-pagamento', [BankController::class, 'statusBank'])->name('bank.statusBank');

    Route::get('/notifications', [NotificationController::class, 'index'])->name('notification.index');
});

