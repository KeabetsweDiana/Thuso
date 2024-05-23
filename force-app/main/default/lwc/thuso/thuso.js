import { LightningElement, track } from 'lwc';
import resetUserPassword from '@salesforce/apex/PasswordResetController.resetUserPassword';

export default class PasswordResetChat extends LightningElement {
    @track userId;
    @track message;
    @track errorMessage;

    handleUserIdChange(event) {
        this.userId = event.target.value;
    }

    resetPassword() {
        resetUserPassword({ userId: this.userId })
            .then(result => {
                this.message = result;
                this.errorMessage = null;
            })
            .catch(error => {
                this.errorMessage = error.body.message;
                this.message = null;
            });
    }
}
