import { Component, OnInit } from '@angular/core';
import { WishlistService } from '../wishlist.service';
import { TrefleService } from '../trefle.service';
import { JoinedPlant, Plant, Wishlist } from '../interfaces/plant';
import { PlantService } from '../plant.service';
import { MyplantService } from '../myplant.service';

@Component({
  selector: 'app-wishlist',
  templateUrl: './wishlist.component.html',
  styleUrls: ['./wishlist.component.css']
})
/** wishlist component*/
export class WishlistComponent {
  /** wishlist ctor */
  constructor(private wishlistData: WishlistService, private plantData: PlantService, private myplantData: MyplantService) { }

  wishlist: JoinedPlant[];

  ngOnInit() {
    this.get();
  }

  delete(id: number) {
    console.log(id);
    this.wishlistData.deleteWishlist(id).subscribe(
      (data: any) => {
        console.log('DELETE WISHLIST DATA' + data);
        this.get();
      },
      //error => console.error(error)
    );
  }

  addToMyPlants(id: number) {
    this.myplantData.postMyPlant(id).subscribe(
      (data: any) => console.log('success! ' + id),
      error => console.error(error)
    );
  }

  get() {
    this.wishlistData.getWishlist().subscribe(
      (data: JoinedPlant[]) => {
        this.wishlist = data;
      },
      error => console.error(error)
    );
  }
}
