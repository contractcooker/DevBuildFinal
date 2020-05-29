import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Wishlist, JoinedPlant } from './interfaces/plant';


@Injectable({
  providedIn: 'root'
})
export class WishlistService {
  
  plantID: number;

  constructor(private http: HttpClient) {
    
  }

  getWishlist(email: string) {
    return this.http.get<JoinedPlant[]>('/api/wishlist/' + email);
  }

  deleteWishlist(wishID: number) {
    console.log("delete Id in wishlist service " + wishID);
    return this.http.delete('/api/wishlist/' + wishID);
  }

  postWishlist(plantID: number, email: string) {
    console.log("The plant ID being passed into the wish object is " + plantID);
    let wish: Wishlist = {

      wishID: 0,
      userID: email,
      plantID: plantID

    };
    console.log("The 'wish.userID' is " + email);
    console.log("The 'wish.plantID' is " + wish.plantID);
    return this.http.post<Wishlist>('/api/wishlist', wish);
  }
}
