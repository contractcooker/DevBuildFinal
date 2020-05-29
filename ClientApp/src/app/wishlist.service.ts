import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Wishlist, JoinedPlant } from './interfaces/plant';


@Injectable({
  providedIn: 'root'
})
export class WishlistService {
  userID: number;
  plantID: number;

  constructor(private http: HttpClient) {
    this.userID = 4;
  }

  getWishlist() {
    return this.http.get<JoinedPlant[]>('/api/wishlist/' + 4);
  }

  deleteWishlist(wishID: number) {
    console.log("delete Id in wishlist service " + wishID);
    return this.http.delete('/api/wishlist/' + wishID);
  }

  postWishlist(plantID: number, email: string) {
    console.log("The plant ID being passed into the wish object is " + plantID);
    let wish: Wishlist = {

      wishID: 0,
      userID: this.userID,
      plantID: plantID

    };
    console.log("The 'wish.userID' is " + wish.userID);
    console.log("The 'wish.plantID' is " + wish.plantID);
    return this.http.post<Wishlist>('/api/wishlist', wish);
  }
}
