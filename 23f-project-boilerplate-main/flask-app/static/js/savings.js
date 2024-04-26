$(document).ready(function() {
    // Function to fetch and display total savings for a user
    function getTotalSavings(userId) {
        $.ajax({
            url: '/savings/total/' + userId,
            type: 'GET',
            success: function(response) {
                $('#totalSavings').html('Total Savings: ' + response.total_savings);
            },
            error: function(xhr, status, error) {
                console.error('Error fetching total savings:', error);
            }
        });
    }

    // Function to fetch and display details of a specific savings transaction
    function getTransactionDetails(savingsId) {
        $.ajax({
            url: '/savings/transaction/' + savingsId,
            type: 'GET',
            success: function(response) {
                // Update #transactionDetails with transaction details
            },
            error: function(xhr, status, error) {
                console.error('Error fetching transaction details:', error);
            }
        });
    }

    // Function to create a new savings transaction
    $('#createTransactionForm').submit(function(event) {
        event.preventDefault();
        // Collect form data
        var formData = $(this).serialize();
        $.ajax({
            url: '/savings/',
            type: 'POST',
            data: formData,
            success: function(response) {
                // Handle success
            },
            error: function(xhr, status, error) {
                console.error('Error creating savings transaction:', error);
            }
        });
    });

    // Function to update an existing savings transaction
    $('#updateTransactionForm').submit(function(event) {
        event.preventDefault();
        // Collect form data
        var formData = $(this).serialize();
        var savingsId = $(this).data('savings-id');
        $.ajax({
            url: '/savings/' + savingsId + '/update',
            type: 'POST',
            data: formData,
            success: function(response) {
                // Handle success
            },
            error: function(xhr, status, error) {
                console.error('Error updating savings transaction:', error);
            }
        });
    });

    // Function to delete a savings transaction
    $('#deleteConfirmation').on('click', '#confirmDelete', function() {
        var savingsId = $(this).data('savings-id');
        $.ajax({
            url: '/savings/' + savingsId + '/delete',
            type: 'POST',
            success: function(response) {
                // Handle success
            },
            error: function(xhr, status, error) {
                console.error('Error deleting savings transaction:', error);
            }
        });
    });

    // Initialize page with initial data (if needed)
});
