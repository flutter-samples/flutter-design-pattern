<a href="https://github.com/flutter-samples/flutter-design-pattern"><img src="https://raw.githubusercontent.com/flutter-samples/flutter-design-pattern/master/github-assets/logo.png" alt="Flutter Samples" /></a>

The project is maintained by a non-profit organisation, along with an amazing collections of Flutter samples. We're trying to make continuous commits for changes along with the Flutter tech progress.


# The Desigin Pattern 

<img src="https://raw.githubusercontent.com/flutter-samples/flutter-design-pattern/master/github-assets/flutter-design-pattern.png" alt="Design Pattern" />

## Goals for this sample

- Shows a state management approach using the [Provider](https://pub.dev/packages/provider) package,mainly use StreamProvider and ChangeNotifier. 
- Show a logic for fetch data from different datasources as above graph.

## Memory fetch data

Change `repositories/catalog.dart`

```
const dataSource = 'memory';
```

`repositories/catalog.dart` A route distribution for fetching data
`memory/catalog.dart` All CURD operations will be here
`file/catalog.dart` Define data

## Sqlite fetch data

Change `repositories/catalog.dart`

```
const dataSource = 'db';
```

#### Notice

You can't use  `cart.items.contains(item)` to compare catalog whether exists in cart,because use database reload data.Add `contains` method in cart controller,and use below

```
cart.contains(item.id)
```

## Todo
- Http implement

---

# Screen Shots

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/flutter-samples/flutter-design-pattern/master/github-assets/Screenshot_1567050012.png" alt="Screen Shots" /></td>
    <td><img src="https://raw.githubusercontent.com/flutter-samples/flutter-design-pattern/master/github-assets/Screenshot_1567050036.png" alt="Screen Shots" /></td>
  </tr>
</table>


---

Welcome Contribute With Pull Request.

---

# About
![微信公众号](https://raw.githubusercontent.com/flutter-samples/flutter-design-pattern/master/github-assets/official.png)

