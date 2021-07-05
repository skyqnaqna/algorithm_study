/*
 백준 1713 후보 추천하기
 21.07.05
 https://github.com/skyqnaqna/algorithm_study/
*/

#include <bits/stdc++.h>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int n, k;
int students[101]; // 추천 횟수
int whereStudent[101]; // 몇 번 사진틀에 있는지
int onFrame[21]; // 몇 번 학생이 있는지
int timeStamp[21]; // 언제 게시됐는지

int getPosition() {
    int res = 0;

    for (int i = 1; i <= n; ++i)
        if (onFrame[i] == 0) return i;

    int minCnt = 1001, minTime = 1001;
    for (int i = 1; i <= n; ++i) {
        if (students[onFrame[i]] < minCnt) {
            minCnt = students[onFrame[i]];
            minTime = timeStamp[i];
            res = i;
        } else if (students[onFrame[i]] == minCnt && timeStamp[i] < minTime) {
            minCnt = students[onFrame[i]];
            minTime = timeStamp[i];
            res = i;
        }
    }

    return res;
}


int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    cin >> n >> k;

    for (int i = 0; i < k; ++i)
    {
        int m;
        cin >> m;
        students[m]++;
        // 사진틀에 있는지 확인
        if (whereStudent[m])
        {
            students[m]++;
        }
        else
        {
            int pos = getPosition();
            int del = onFrame[pos];

            whereStudent[m] = pos;
            whereStudent[del] = 0;
            students[m] = 1;
            students[del] = 0;
            timeStamp[pos] = i;
            onFrame[pos] = m;
        }
    }

    for (int i = 1; i <= 100; ++i) {
        if (students[i] > 0) cout << i << " ";
    }
    cout << endl;

    return 0;
}