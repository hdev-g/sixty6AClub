import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="desk-availability"
export default class extends Controller {
  static targets = ["date", "submitButton", "availabilityInfo"];

  connect() {
    // Call the checkAvailability function when the form is connected to the controller
    this.checkAvailability();
  }

  // Function to check the availability and update the availability info
  async checkAvailability() {
    const selectedDate = new Date(this.dateTarget.value);
    console.log("Selected date value:", this.dateTarget.value);
    const today = new Date();
    const yesterday = new Date();
    yesterday.setDate(today.getDate() - 1);
    
    // const desksAvailable = 4; // Replace with the actual number of desks available

    try {
      const formattedDate = selectedDate.toISOString().split("T")[0];

      // Make an AJAX request to the API endpoint
      const response = await fetch(`/bookings/desks_available?date=${formattedDate}`);
      const data = await response.json();
      console.log(data)

      // Access the available_days data from the response
      const desksAvailable = data.desks_available;

      if (selectedDate < yesterday || desksAvailable === 0) {
        this.submitButtonTarget.disabled = true;
        this.availabilityInfoTarget.textContent =
          selectedDate < yesterday
            ? "Date is in the past. Please select another date."
            : "No desks available on this date. Please select another date.";
      } else {
        this.submitButtonTarget.disabled = false;
        this.availabilityInfoTarget.textContent = `Desks available: ${desksAvailable}`;
      }
    }
    catch (error) {
      console.error("Error fetching available days:", error);
    }
  }
}
