import { Component, OnInit } from '@angular/core';
import { WishlistService } from '../wishlist.service';
import { TrefleService } from '../trefle.service';
import { JoinedPlant, Plant, Wishlist } from '../interfaces/plant';
import { PlantService } from '../plant.service';
import { MyplantService } from '../myplant.service';
import { AuthorizeService } from '../../api-authorization/authorize.service';
import { UserDataService } from '../user-data.service';
import { Users } from '../interfaces/plant';
import { Observable } from 'rxjs';
import { map, tap } from 'rxjs/operators';

@Component({
  selector: 'app-wishlist',
  templateUrl: './wishlist.component.html',
  styleUrls: ['./wishlist.component.css']
})
/** wishlist component*/
export class WishlistComponent {
  /** wishlist ctor */
  constructor(private authorizeService: AuthorizeService, private userData: UserDataService, private wishlistData: WishlistService, private plantData: PlantService, private myplantData: MyplantService) { }

  wishlist: JoinedPlant[];
  public isAuthenticated: Observable<boolean>;
  email: string;
  ngOnInit() {
    
    this.isAuthenticated = this.authorizeService.isAuthenticated();
    this.authorizeService.getUser().subscribe(user => this.email = user.name);
    this.get(this.email);
  }

  delete(id: number) {
    console.log(id);
    this.wishlistData.deleteWishlist(id).subscribe(
      (data: any) => {
        console.log('DELETE WISHLIST DATA' + data);
        this.get(this.email);
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

  get(email: string) {
    console.log("wish get email: " + email)
    this.wishlistData.getWishlist(email).subscribe(
      (data: JoinedPlant[]) => {
        this.wishlist = data;
      },
      error => console.error(error)
    );
  }
}
