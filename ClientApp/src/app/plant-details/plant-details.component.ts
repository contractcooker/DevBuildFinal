import { Component, Input } from '@angular/core';
import { Plant, Wishlist } from '../interfaces/plant';
import { PlantService } from '../plant.service';
import { MyplantService } from '../myplant.service';
import { WishlistService } from '../wishlist.service';
import { AuthorizeService } from '../../api-authorization/authorize.service';
import { UserDataService } from '../user-data.service';
import { Users } from '../interfaces/plant';
import { Observable } from 'rxjs';
import { map, tap } from 'rxjs/operators';

@Component({
  selector: 'app-plant-details',
  templateUrl: './plant-details.component.html',
  styleUrls: ['./plant-details.component.css']
})
/** plant-details component*/
export class PlantDetailsComponent {
  @Input() plant: Plant;
  
  /** plant-details ctor */
  constructor(private authorizeService: AuthorizeService, private userData: UserDataService, private plantData: PlantService, private myplantData: MyplantService, private wishListData: WishlistService) {

  }
  email: string;

  ngOnInit() {
    //this.isAuthenticated = this.authorizeService.isAuthenticated();
    //this.authorizeService.getUser().subscribe(user => this.email = user.name);
    console.log("email: " + this.email);
  }

  addToWishlist(id: number, e: string) {
    console.log("addwish email: " + e);
    this.wishListData.postWishlist(id, e).subscribe(
      (data: any) => console.log('success! ' + id),
      error => console.error(error)
    );
  }

  addToMyPlants(id: number) {
    this.myplantData.postMyPlant(id).subscribe(
      (data: any) => console.log('success! ' + id),
      error => console.error(error)
    );
  }

}
