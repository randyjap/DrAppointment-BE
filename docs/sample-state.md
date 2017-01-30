```js
{
  session: {
    id: 1,
    first_name: "John",
    last_name: "Doe",
    country_code: 123,
    phone_number: "123-123-1232"
  },
  errors: ["phone number is not valid", "booking couldn't be made"],
  doctorResults: [
    {
      id: 1,
      name: "Dr. Richard Kimble 123 ABC Street Tow...",
      favorited: true
    },
    {
      id: 2,
      name: "Dr. Anna Kimble 123 ABC Street Tow...",
      favorited: false
    }
  ],
  favoriteDoctors: [
    {
      image_url: "...image123.jpg",
      name: "Dr. Richard Kimble",
      phone: "123-123-1234"
    },
    {
      image_url: "...image123.jpg",
      name: "Dr. Anna Kimble",
      phone: "+1 123-123-1234"
    }
  ]
  doctorSchedule: {
    id: 2,
    name: "Dr. John Smith",
    address: "123 ABC Street",
    address2: "ABC Town, California 99999",
    distance: "1.2 miles",
    image_url: "...image123.jpg",
    favorited: true,
    first_day: [
      {
        time: "08:00",
        status: "N/A",
        date: "01/30 (Mon)"
      },
      {
        time: "08:15",
        status: "N/A",
        date: "01/30 (Mon)"
      },
      {
        time: "08:30",
        status: "N/A",
        date: "01/30 (Mon)"
      },
      ...
    ],
    second_day: [
      {
        time: "08:00",
        status: "N/A",
        date: "01/30 (Mon)"
      },
      {
        time: "08:15",
        status: "N/A",
        date: "01/30 (Mon)"
      },
      {
        time: "08:30",
        status: "N/A",
        date: "01/30 (Mon)"
      },
      ...
    ],
    third_day: [
      {
        time: "08:00",
        status: "N/A",
        date: "01/30 (Mon)"
      },
      {
        time: "08:15",
        status: "N/A",
        date: "01/30 (Mon)"
      },
      {
        time: "08:30",
        status: "N/A",
        date: "01/30 (Mon)"
      },
      ...
    ]
  }
}
```
