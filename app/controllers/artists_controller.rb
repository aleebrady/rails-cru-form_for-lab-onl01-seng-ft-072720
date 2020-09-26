class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def show
        find_artist
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params(:name, :bio))
        @artist.save
        redirect_to artist_path(@artist)
    end

    def edit
        find_artist
    end

    def update
        @artist = find_artist
        @artist.update(artist_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    private

    def find_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params(*args)
        params.required(:artist).permit(*args)
    end

end