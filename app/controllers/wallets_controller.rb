class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all
  end

  def send_wallet

  end
end
