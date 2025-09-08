class PagesController < ApplicationController
  def biography
  end

  def contacts
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(contact_params)

    if @contact.save
      # You can add email notification here later
      redirect_to contacts_path, notice: 'Thank you for your message! I will get back to you soon.'
    else
      render :contacts, status: :unprocessable_entity
    end
  end

  def writing
  end

  def photography
  end

  def music
  end

  def development
  end

  def download_biography
    # This will be implemented later to generate/serve a PDF
    redirect_to biography_path, notice: 'Biography download will be available soon.'
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
