import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home/home.component';
import { CounterComponent } from './counter/counter.component';
import { FetchDataComponent } from './fetch-data/fetch-data.component';
import { ApiAuthorizationModule } from 'src/api-authorization/api-authorization.module';
import { AuthorizeGuard } from 'src/api-authorization/authorize.guard';
import { AuthorizeInterceptor } from 'src/api-authorization/authorize.interceptor';
import { AddPlantComponent } from './add-plant/add-plant.component';
import { MyPlantsComponent } from './my-plants/my-plants.component';
import { PlantDetailsComponent } from './plant-details/plant-details.component';
import { PlantsComponent } from './plants/plants.component';
import { SuggestionPageComponent } from './suggestion-page/suggestion-page.component';
import { WishlistComponent } from './wishlist/wishlist.component';
import { PlantService } from './plant.service';
import { MyplantService } from './myplant.service';
import { WishlistService } from './wishlist.service';
import { TrefleService } from './trefle.service';


@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    CounterComponent,
    FetchDataComponent,
    AddPlantComponent,
    MyPlantsComponent,
    PlantDetailsComponent,
    PlantsComponent,
    SuggestionPageComponent,
    WishlistComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    ApiAuthorizationModule,
    RouterModule.forRoot([
      { path: '', component: PlantsComponent },
      { path: 'counter', component: CounterComponent },
      { path: 'fetch-data', component: FetchDataComponent, canActivate: [AuthorizeGuard] },
      { path: 'plant-details', component: PlantDetailsComponent },
      { path: 'my-plants', component: MyPlantsComponent, canActivate: [AuthorizeGuard] },
      { path: 'wishlist', component: WishlistComponent, canActivate: [AuthorizeGuard] },
      { path: 'add-plant', component: AddPlantComponent },
      { path: 'suggestion-page', component: SuggestionPageComponent },
    ])
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: AuthorizeInterceptor, multi: true }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
