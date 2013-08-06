class LinkedAccountsController < ApplicationController
  # GET /linked_accounts
  # GET /linked_accounts.json
  def index
    @linked_accounts = current_user.linked_accounts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @linked_accounts }
    end
  end

  # GET /linked_accounts/1
  # GET /linked_accounts/1.json
  def show
    @linked_account = LinkedAccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @linked_account }
    end
  end

  # GET /linked_accounts/new
  # GET /linked_accounts/new.json
  def new
    @linked_account = LinkedAccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @linked_account }
    end
  end

  # GET /linked_accounts/1/edit
  def edit
    @linked_account = LinkedAccount.find(params[:id])
  end

  # POST /linked_accounts
  # POST /linked_accounts.json
  def create
    @linked_account = LinkedAccount.new(params[:linked_account])
    @linked_account.user = current_user

    respond_to do |format|
      if @linked_account.save
        format.html { redirect_to @linked_account, notice: "Аккаунт успешно привязан. Теперь при размещении обявлений на этом сайте, Вы можете при помощи данной системы разместить на сайте #{@linked_account.type_of_linked_account}" }
        format.json { render json: @linked_account, status: :created, location: @linked_account }
      else
        format.html { render action: "new" }
        format.json { render json: @linked_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /linked_accounts/1
  # PUT /linked_accounts/1.json
  def update
    @linked_account = LinkedAccount.find(params[:id])

    respond_to do |format|
      if @linked_account.update_attributes(params[:linked_account])
        format.html { redirect_to @linked_account, notice: 'Linked account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @linked_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linked_accounts/1
  # DELETE /linked_accounts/1.json
  def destroy
    @linked_account = LinkedAccount.find(params[:id])
    @linked_account.destroy

    respond_to do |format|
      format.html { redirect_to linked_accounts_url }
      format.json { head :no_content }
    end
  end
end
