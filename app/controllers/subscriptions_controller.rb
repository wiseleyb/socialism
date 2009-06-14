class SubscriptionsController < ApplicationController

  before_filter :login_required
  before_filter :get_subscription

  # GET /subscriptions
  # GET /subscriptions.xml
  def index
    redirect_to(@subscription)
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subscription }
    end
  end

  # GET /subscriptions/new
  # GET /subscriptions/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subscription }
    end
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions
  # POST /subscriptions.xml
  def create
    #@subscription = Subscription.new(params[:subscription])

    respond_to do |format|
      if @subscription.save
        flash[:notice] = 'Subscription was successfully created.'
        format.html { redirect_to(@subscription) }
        format.xml  { render :xml => @subscription, :status => :created, :location => @subscription }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subscriptions/1
  # PUT /subscriptions/1.xml
  def update
    respond_to do |format|
      if @subscription.update_attributes(params[:subscription])
        flash[:notice] = 'Subscription was successfully updated.'
        format.html { redirect_to(@subscription) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.xml
  def destroy
    @subscription.destroy

    respond_to do |format|
      format.html { redirect_to(subscriptions_url) }
      format.xml  { head :ok }
    end
  end

  private
  
    def get_subscription
      @subscription = Subscription.find_or_create_by_user_id(current_user.id)
      @user_profile = UserProfile.find_or_create_by_user_id(current_user.id)
      @credit_card = ActiveMerchant::Billing::CreditCard.new
      if params[:user_profile]
        params[:user_profile].delete(:user_id)
      end
      if params[:subscription]
        params[:subscription].delete(:user_id)
      end
    end

end
