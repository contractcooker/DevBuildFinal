import { Component, OnInit } from '@angular/core';
import { AuthorizeService } from '../../api-authorization/authorize.service';
import { UserDataService } from '../user-data.service';
import { Users } from '../interfaces/plant';
import { Observable } from 'rxjs';
import { map, tap } from 'rxjs/operators';


@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {
  public isAuthenticated: Observable<boolean>;
  public userID: Observable<string>;
  public userName: Observable<string>;

  constructor(private authorizeService: AuthorizeService, private userData: UserDataService) { }
  email: string;
  uid: number;
  ngOnInit() {
    this.isAuthenticated = this.authorizeService.isAuthenticated();
    this.authorizeService.getUser().subscribe(user => this.email = user.name);


  }

}
