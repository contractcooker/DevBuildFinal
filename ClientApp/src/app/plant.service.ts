import { Injectable } from '@angular/core';
import { Plant } from './interfaces/plant';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs/internal/Observable'

@Injectable({
  providedIn: 'root'
})
export class PlantService {
  constructor(private http: HttpClient) {

  }

  getPlants() {
    return this.http.get<Plant[]>('/api/plant');
  }

  getPlant(id: number) {
    return this.http.get<Plant>(`api/plant/${id}`);
  }

  postPlant(newPlant: Plant) {

    return this.http.post<Plant>('/api/plant', newPlant);
  }

}
