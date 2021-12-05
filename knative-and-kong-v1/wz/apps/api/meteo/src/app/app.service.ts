import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getData(): Array<{ id: number; city: string; temperature: number }> {
    return [
      {
        id: 1,
        city: 'Geneva',
        temperature: 19.5,
      },
      {
        id: 2,
        city: 'Lausanne',
        temperature: 14.5,
      },
      {
        id: 3,
        city: 'Montreux',
        temperature: 9.5,
      },
    ];
  }
}
