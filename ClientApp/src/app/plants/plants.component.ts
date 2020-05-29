import { Component, OnInit, Input } from '@angular/core';
import { Plant } from '../interfaces/plant';
import { PlantService } from '../plant.service';
import { WishlistService } from '../wishlist.service';
import { AuthorizeService } from '../../api-authorization/authorize.service';
import { UserDataService } from '../user-data.service';
import { Users } from '../interfaces/plant';
import { Observable } from 'rxjs';
import { map, tap } from 'rxjs/operators';

@Component({
  selector: 'app-plants',
  templateUrl: './plants.component.html',
  styleUrls: ['./plants.component.css']
})
/** plants component*/
export class PlantsComponent {
  /** plants ctor */
  constructor(private authorizeService: AuthorizeService, private userData: UserDataService, private plantData: PlantService, private wishlistData: WishlistService) {

  }
  email: string;

  plant: Plant[];

  ngOnInit() {
    this.get();
    //this.isAuthenticated = this.authorizeService.isAuthenticated();
    //this.authorizeService.getUser().subscribe(user => this.email = user.name);
    console.log("email: " + this.email);
  }

  get() {
    this.plantData.getPlants().subscribe(
      (data: Plant[]) => {
        this.plant = data;
      },
      error => console.error(error)
    );
  }



}
