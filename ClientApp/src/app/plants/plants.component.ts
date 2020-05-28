import { Component, OnInit, Input } from '@angular/core';
import { Plant } from '../interfaces/plant';
import { PlantService } from '../plant.service';
import { WishlistService } from '../wishlist.service';
@Component({
  selector: 'app-plants',
  templateUrl: './plants.component.html',
  styleUrls: ['./plants.component.css']
})
/** plants component*/
export class PlantsComponent {
  /** plants ctor */
  constructor(private plantData: PlantService, private wishlistData: WishlistService) {

  }

  plant: Plant[];

  ngOnInit() {
    this.get();
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
