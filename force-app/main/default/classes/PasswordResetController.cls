public with sharing class PasswordResetController {
    
    @AuraEnabled
    public static String resetUserPassword(Id userId) {
        User user = [SELECT Id, Email FROM User WHERE Id = :userId LIMIT 1];
        if (user == null) {
            throw new AuraHandledException('User not found');
        }

        try {
            // Reset password
            System.setPassword(user.Id, generateRandomPassword());

            // Optionally, send a notification email
            sendPasswordResetEmail(user.Email);
            
            return 'Password reset successful for ' + user.Email;
        } catch (Exception e) {
            throw new AuraHandledException('Error resetting password: ' + e.getMessage());
        }
    }
    
    private static String generateRandomPassword() {
        // Generate a random password
        return 'newStrongPassword123!';
    }

    private static void sendPasswordResetEmail(String email) {
        // Logic to send password reset email
    }
}
