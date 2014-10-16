class LandingsController < ApplicationController
  def index
    @title = 'MediaMakers — 29 октября в DI Telegraph'
    @about =  "Первая конференция о людях, меняющих
              ландшафт медиа. Людях, создающих
              инновационные проекты и продукты.
              Людях, переворачивающих привычную
              среду с ног на голову. Здесь и сейчас"
  end
end
