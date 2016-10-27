class CustomersController < ApplicationController
  def index
    @customers = Customer.where(
      "lower(first_name) LIKE :first_name OR " \
                                      "lower(last_name) LIKE :last_name OR " \
                                      "lower(email) = :email", first_name: "pat%",
                                                               last_name: "pat%",
                                                               email: "pat@example.com"
    ).order("email = 'pat@example.com' desc, last_name asc")
  end
end
