class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :destroy, :show] # samo ove 4 metode pozivaju metodu set_article

	# Metoda za ispis svih artikala
	def index
		@articles = Article.all
	end

	# Nova metoda koja kreira objekt Article
	def new
		@article = Article.new
	end

	# Metoda za mjenjanje podataka u article
	def edit
		
	end

	def create
		# Spasavanje novog clanka	
		@article = Article.new(article_params)
		if @article.save
			flash[:success] = "Article was successfully created"
			# Nakon spasavanja se prebaci na show metodu, odnosno prikazuje unesene podatke
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	# Metoda za mjenjanje podataka
	def update
		
		if @article.update(article_params)
			flash[:success] = "Article was successfully updated"
			redirect_to article_path(@article)
		else	
			render 'edit'
		end
	end

	# Metoda za prikazivanje podataka 
	def show
		
	end

	# Metoda za brisanje podataka
	def destroy				
		@article.destroy
		flash[:danger] = "Article succefully deleted"
		redirect_to articles_path
	end

private
	# U ovoj metodi se ispituje da li su zadovoljeni svi uslovi kako bi se poslalo u metodu create
	def article_params
		params.require(:article).permit(:title, :description)
	end

	def set_article
		@article = Article.find(params[:id])
	end
end