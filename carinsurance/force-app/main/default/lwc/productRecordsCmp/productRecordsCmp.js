import { LightningElement, wire } from 'lwc';
import getcontract from '@salesforce/apex/ContractRecords.getcontract';
import getproduct from '@salesforce/apex/ProductRecords.getproduct';

export default class ProductRecordsCmp extends LightningElement {
    productRecords;
    contractRecords;
    
    connectedCallback() {
    this.retrieveContractRecords();
    }

    retrieveContractRecords() {
        getcontract()
          .then(result => {
            this.contractRecords = result;
          })
          .catch(error => {
            console.error('Error retrieving contract records:', error);
          });
  }
  
}

//    cols = columns;
//    productList;

//     @wire (getproduct) wiredproducts({data,error}){
//         if (data) {
//             this.productList = data;
//         console.log(data); 
//         } else if (error) {
//         console.log(error);
//         }
//    }