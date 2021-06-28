class ReviewsController < ApplicationController
    
    before_action :set_review, only:[:show,:update,:destroy]

    def index
        @reviews=Review.all()
        render json:@reviews
    end

    def show
        render json:@review
    end

    def update
        if @review.save(review_params)
            render json: @review
        else
            render @review.errors , status: :unprocessable_review
        end
    end

    def create
        @review=Review.new(review_params)
        if @review.save(review_params)
            render json: @review
        else
            render @review.errors , status: :unprocessable_review
        end
    end

    def destroy
       @review.destroy()
    end

    private 

    def set_review
        @review=Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:body,:title);
    end
    
end