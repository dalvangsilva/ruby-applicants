class HomeController < ApplicationController
  def index
    # Nao acho que essa chamada precise ser feito toda hora
    # A maneira como pensei seria de fazer a execucao agendada no chron ou durante o deploy
    Webmotors.perform_async

    @makes = Make.all
  end
end
