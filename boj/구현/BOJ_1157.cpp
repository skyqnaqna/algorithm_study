/*----------------------
|백준 1157 단어공부
|21.01.29
----------------------*/

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#define INF 2147000000

using namespace std;

int alpha[26] = {0};

int main()
{
    ios_base::sync_with_stdio(false); cin.tie(0);
    string s;
    cin >> s;
    transform(s.begin(), s.end(), s.begin(), ::toupper);

    for (auto a : s)
    {
        alpha[a - 'A']++;
    }

    int max = -1;
    char result;
    for (int i = 0; i < 26; ++i)
    {
        if (alpha[i] > max)
        {
            max = alpha[i];
            result = i + 'A';
        }
        else if (alpha[i] == max)
        {
            result = '?';
        }
    }

    cout << result << "\n";

    return 0;
}