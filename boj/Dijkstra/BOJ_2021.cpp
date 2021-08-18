/*
 백준 2021 최소 환승 경로
 21.08.18
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF 2e9
#define endl "\n"

int n, m, from, to;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> m;
    vector <vector <int> > stations(n + 1), lines(m);
    vector <int> station_distance(n + 1, -1); // 각 역까지의 환승 횟수
    vector <bool> visitedLine(m, false); // 각 노선 방문 체크

    for (int i = 0; i < m; ++i) {
        int x; cin >> x;
        while (x != -1) {
            stations[x].push_back(i); // 해당 역엔 노선정보 넣기
            lines[i].push_back(x); // 해당 노선엔 역 정보 넣기
            cin >> x;
        }
    }

    cin >> from >> to;

    queue<pii>q;

    // 시작 역과 해당 노선에 있는 역들의 거리 초기화
    for (auto &line : stations[from]) {
        visitedLine[line] = true;
        for (auto &station : lines[line]) {
            if (station_distance[station] == -1) {
                station_distance[station] = 0;
                q.push({0, station});
            }
        }
    }

    while (!q.empty()) {
        int dist = q.front().first;
        int now = q.front().second;
        q.pop();

        for (auto &line : stations[now]) {
            if (!visitedLine[line]) {
                visitedLine[line] = true;

                // 방문하지 않은 노선이라면 해당 노선의 역들의 거리를 갱신해준다
                for (auto &station : lines[line]) {
                    if (station_distance[station] == -1) {
                        station_distance[station] = dist + 1;
                        q.push({dist + 1, station});
                    }
                }
            }
        }
    }

    cout << station_distance[to] << endl;

    return 0;
}