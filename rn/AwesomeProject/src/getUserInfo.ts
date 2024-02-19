const jwt_secret = '0489ca032e3845b98bdf62d55a301679';

export async function getUserInfo(token: string) {
    try {
        const response = await fetch('')

        if (!response.ok) {
            throw new Error('Bad fetch reponse');
        }
    } catch (error) {
        //Handle the error
        console.error("Getting the user info fails")
    }
}