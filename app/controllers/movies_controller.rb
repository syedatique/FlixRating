class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @category_id = params[:movie][:category_id]
    @title = params[:movie][:title]
    if @title && @title > ''
    @title = @title.gsub(' ', '+') # replacing any space with +
    # look it up from OMDB
    url = "http://www.omdbapi.com/?t=#{@title}"
    @search_results = HTTParty.get(url)
    end

    @movie = Movie.new
    @movie.title = @search_results['Title'].gsub("'","")
    @movie.release_year = @search_results['Year'].to_i
    @movie.director = @search_results['Director'].gsub("'","''")
    @movie.stars = @search_results['Actors'].gsub("'","''")
    @movie.plot = @search_results['Plot'].gsub("'","''")
    @movie.poster_url = @search_results['Poster'].gsub("'","''")
    @movie.imdb_rating = @search_results['imdbRating'].to_f
    @movie.metascore = @search_results['Metascore'].to_f
    @movie.category_id = @category_id
    @movie.user_id = current_user.id


    # @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :category_id, :user_id, :release_year, :plot, :director, :stars, :vote, :imdb_id, :imdb_rating, :poster_url, :metascore)
    end
end
