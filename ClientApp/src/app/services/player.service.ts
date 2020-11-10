import { Injectable } from '@angular/core';
import { Player } from '../interfaces/player';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class PlayerService {

  apiUrl = '/api/';

  constructor(private http: HttpClient) { }

  authpalyer(name: string) {
    return this.http.get<Player>(`${this.apiUrl}`)
  }
}
