class ClientContactsController < ApplicationController
  before_action :set_client_contact, only: %i[ show edit update destroy ]

  # GET /client_contacts or /client_contacts.json
  def index
    @client_contacts = ClientContact.all
  end

  # GET /client_contacts/1 or /client_contacts/1.json
  def show
  end

  # GET /client_contacts/new
  def new
    @client_contact = ClientContact.new
  end

  # GET /client_contacts/1/edit
  def edit
  end

  # POST /client_contacts or /client_contacts.json
  def create
    @client_contact = ClientContact.new(client_contact_params)

    respond_to do |format|
      if @client_contact.save
        format.html { redirect_to client_contact_url(@client_contact), notice: "Client contact was successfully created." }
        format.json { render :show, status: :created, location: @client_contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_contacts/1 or /client_contacts/1.json
  def update
    respond_to do |format|
      if @client_contact.update(client_contact_params)
        format.html { redirect_to client_contact_url(@client_contact), notice: "Client contact was successfully updated." }
        format.json { render :show, status: :ok, location: @client_contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_contacts/1 or /client_contacts/1.json
  def destroy
    @client_contact.destroy

    respond_to do |format|
      format.html { redirect_to client_contacts_url, notice: "Client contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_contact
      @client_contact = ClientContact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_contact_params
      params.fetch(:client_contact, {})
    end
end
