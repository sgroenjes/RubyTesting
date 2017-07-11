require 'rails_helper'

describe MoviesController do
    before (:each) do
        @mock_movie_update_attributes = {:director => 'Ron Clements'}
        @mock_movie = FactoryGirl.create(:movie)
    end
    
    describe "Add director name" do
      it "locates the requested movie" do
        put :update, id: @mock_movie, movie: @mock_movie_update_attributes
        expect(assigns(:movie)).to eq(@mock_movie)
      end
      it "changes the requested movies director name" do
        put :update, id: @mock_movie, movie: @mock_movie_update_attributes
        @mock_movie.reload
        expect(@mock_movie.director).to eq("Ron Clements")
      end
      it "redirects to the updated movie" do
        put :update, id: @mock_movie, movie: @mock_movie_update_attributes
        expect(response).to redirect_to @contact
      end
    end
  
    describe "Find movies with same director" do
      it "assigns the requested movie to @movie" do
        get :same_director, id: @mock_movie
        expect(assigns(:movie).title).to include("Aladdin")
      end
      it "renders the same_director template" do
        get :same_director, id: @mock_movie
        expect(response).to render_template(:same_director)
      end
      it 'should make the same_director results available to that template' do
          @mock_movie2 = FactoryGirl.create(:movie, id: 2, title: 'Another Movie', director: 'Ron Clements')
          @mock_movies = [@mock_movie, @mock_movie2]
          get :same_director, id: @mock_movie
          expect(assigns(:movies)).to eq (@mock_movies)
      end
    end
    
    describe "the show method" do
      it "assigns the requested movie to @movie" do
        get :show, id: @mock_movie
        expect(assigns(:movie).title).to include("Aladdin")
      end
      it "renders the show template" do
        get :show, id: @mock_movie
        expect(response).to render_template(:show)
      end
    end
end