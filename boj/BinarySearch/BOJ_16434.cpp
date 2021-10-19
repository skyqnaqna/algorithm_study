/*
 21.10.19
 백준 16434 드래곤 앤 던전
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)2e9
#define endl "\n"
#define TXTOPEN freopen("input.txt", "r", stdin)

int n;
ll atk;
vector <pair <ll, pll> > rooms;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
//    TXTOPEN;

    cin >> n >> atk;

    ll left = 1, right = 0;

    for (int i = 0; i < n; ++i) {
        ll t, a, h;
        cin >> t >> a >> h;
        rooms.push_back({t, {a, h}});
        if (t == 1) {
            right += (h / atk - 1) * a + 1;

            if (h % atk) right += a;
        }
    }

    ll maxHp = right;

    while (left <= right) {
        ll mid = (left + right) / 2;
        ll curHp = mid, curAtk = atk;

        for (auto &room : rooms) {
            if (curHp <= 0) break;
            if (room.first == 1) {
                ll enemyAtk = room.second.first;
                ll enemyHp = room.second.second;

                ll cnt = enemyHp / curAtk;
                if (enemyHp % curAtk) ++cnt;

                if (curHp - enemyAtk * (cnt - 1) <= 0) {
                    curHp = 0;
                } else {
                    curHp -= enemyAtk * (cnt - 1);
                }
            } else {
                curAtk += room.second.first;
                curHp += room.second.second;

                if (curHp > mid) curHp = mid;
            }
        }

        if (curHp > 0) {
            right = mid - 1;
            maxHp = min(maxHp, mid);
        } else {
            left = mid + 1;
        }
    }

    cout << maxHp << endl;

    return 0;
}