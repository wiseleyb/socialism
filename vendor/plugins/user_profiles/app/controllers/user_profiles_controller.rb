class UserProfilesController < ApplicationController
  
  before_filter :login_required
  before_filter :get_user_profile
  
  # GET /user_profiles
  # GET /user_profiles.xml
  def index
    redirect_to(@user_profile)
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_profile }
    end
  end

  # GET /user_profiles/new
  # GET /user_profiles/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_profile }
    end
  end

  # GET /user_profiles/1/edit
  def edit
  end

  # POST /user_profiles
  # POST /user_profiles.xml
  def create
    
    respond_to do |format|
      if @user_profile.save
        flash[:notice] = 'UserProfile was successfully created.'
        format.html { redirect_to(@user_profile) }
        format.xml  { render :xml => @user_profile, :status => :created, :location => @user_profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_profiles/1
  # PUT /user_profiles/1.xml
  def update
    respond_to do |format|
      if @user_profile.update_attributes(params[:user_profile])
        flash[:notice] = 'UserProfile was successfully updated.'
        format.html { redirect_to(@user_profile) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.xml
  def destroy
    raise "Not implemented"
    @user_profile.destroy

    respond_to do |format|
      format.html { redirect_to(user_profiles_url) }
      format.xml  { head :ok }
    end
  end
  
  private

    def get_user_profile
      @user_profile = UserProfile.find_or_create_by_user_id(current_user.id)
      if params[:user_profile]
        params[:user_profile].delete(:user_id)
      end
    end
  
end