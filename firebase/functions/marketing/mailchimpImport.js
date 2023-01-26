const functions = require('firebase-functions');
const admin = require('firebase-admin');

const client = require("@mailchimp/mailchimp_marketing");

exports.mailchimpImport = functions.runWith({
    timeoutSeconds: 300,
    memory: '1GB',
    secrets: ['MAILCHIMP_KEY']
})
    .firestore.document('test/{Id}')
    .onWrite(async (change, context) => {

        //const payload = req.body;
        client.setConfig({
            apiKey: process.env.MAILCHIMP_KEY,
            server: "us17",
        });

        const users = await admin.firestore().collection('users').get();

        let testUsers = [
            "test74@gmail.com",
            "testprod6@gmail.com",
            "annpelter@gmail.com",
            "testprod4@gmail.com",
            "testprod7@gmail.com",
            "test123@gmail.com",
            "andy1213341422@gmail.com",
            "testprod3@gmail.com",
            "testa321@gmail.com",
            "garri2314@gmail.com",
            "testg4@gmail.com",
            "testprod14@gmail.com",
            "testprod44@gmail.com"
        ];

        users.forEach(async user => {
            const userPath = user.ref.path;
            if (testUsers.includes(user.data().email)) {
                functions.logger.log("User: ", user.data().email);
                const deleteAccounts = await admin.firestore().collection('accounts').where('accountOwner', '==', userPath).get();
                deleteAccounts.forEach(async account => {
                    await account.ref.delete().then(() => {
                        functions.logger.log("Deleted account: ", account.id);
                    }).catch((error) => {
                        functions.logger.log("Error deleting account: ", error);
                    });
                });
                const deleteBudgets = await admin.firestore().collection('budgets').where('budgetOwner', '==', userPath).get();

                deleteBudgets.forEach(async budget => {

                    const categories = await admin.firestore().collection('budgets').doc(budget.id).collection('categories').get();

                    categories.forEach(async category => {
                        await category.ref.delete().then(() => {
                            functions.logger.log("Deleted category: ", category.id);
                        }).catch((error) => {
                            functions.logger.log("Error deleting category: ", error);
                        });
                    });
                    await budget.ref.delete().then(() => {
                        functions.logger.log("Deleted budget: ", budget.id);
                    }).catch((error) => {
                        functions.logger.log("Error deleting budget: ", error);
                    });
                });

                const deleteTransactions = await admin.firestore().collection('transactions').where('transactionOwner', '==', userPath).get();

                deleteTransactions.forEach(async transaction => {
                    await transaction.ref.delete().then(() => {
                        functions.logger.log("Deleted transaction: ", transaction.id);
                    }).catch((error) => {
                        functions.logger.log("Error deleting transaction: ", error);
                    });
                });

                await admin.auth().deleteUser(user.id).then(() => {
                    functions.logger.log("Deleted user: ", user.id);
                }).catch((error) => {
                    functions.logger.log("Error deleting user: ", error);
                });

                await user.ref.delete().then(() => {
                    functions.logger.log("Deleted user ref: ", user.id);
                }).catch((error) => {
                    functions.logger.log("Error deleting user ref: ", error);
                });
            }
            else {
                functions.logger.log("User in testlist: ", user.data().email);
            }

        });

        // functions.logger.log(userList);

        // let userDocs = users.docs.data().map(user => {
        //     return {
        //         email_address: user.data().email,
        //         status: "subscribed",
        //         merge_fields: {
        //             FULLNAME: user.data().display_name ?? "",
        //             UNAME: user.data().username ?? "",
        //             CHANNEL: user.data().acq_channel ?? "",
        //         }
        //     };
        // });
        // const data = doc.data();
        // const email = data.email;
        // const name = data.display_name ?? "";
        // const username = data.username ?? "";
        // const channel = data.acq_channel ?? "";

        // const response = await client.lists.batchListMembers("6704dd2600", {
        //     members: [
        // {
        //     email_address: 'testprod15@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Karo',
        //         CHANNEL: 'Other news websites or blogs'
        //     }
        // },
        // {
        //     email_address: 'Odimegwuphilip40@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: 'salamiyemisi0208@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: 'Yemisi Salami', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: 'abubakarsalisubarde@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'abubakar salisu baRde',
        //         UNAME: 'Adewizzy1',
        //         CHANNEL: 'From paid advertisements'
        //     }
        // },
        // {
        //     email_address: 'chijiokecjgreat@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'chijis', CHANNEL: '' }
        // },
        // {
        //     email_address: 'adebowalee372@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: 'Adebowale Emmanuel', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: '5bqy2aj4a6242xxctjxtv65wyy-00@cloudtestlabaccounts.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Nuage Laboratoire',
        //         UNAME: 'Ggx',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'testprod4@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'Sally', CHANNEL: 'Evi Finance Blog' }
        // },
        // {
        //     email_address: 'electroinspire@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Enoch King-Olayinka',
        //         UNAME: 'Kingolayinka',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'test94@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: 'wave96312@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Wave39 Wave',
        //         UNAME: 'John',
        //         CHANNEL: 'None of the above'
        //     }
        // },
        // {
        //     email_address: 'okoyeobumneme876@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Obumneme Okoye',
        //         UNAME: 'Obumneme',
        //         CHANNEL: 'None of the above'
        //     }
        // },
        // {
        //     email_address: 'maureenfranciss5@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Maureen Franciss',
        //         UNAME: 'Muryne123',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'rexbox1235@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'Stunner', CHANNEL: 'None of the above' }
        // },
        // {
        //     email_address: 'keze69135@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'kelechi eze',
        //         UNAME: 'Kelechi',
        //         CHANNEL: 'From a friend'
        //     }
        // },
        // {
        //     email_address: 'dgrawa22@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: 'Babagana Mustapha', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: 'annpelter@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Adedd',
        //         CHANNEL: 'Twitter, Instagram, etc.'
        //     }
        // },
        // {
        //     email_address: 'testprod2@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'Temmy', CHANNEL: 'None of the above' }
        // },
        // {
        //     email_address: 'christianaitele@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Itele',
        //         CHANNEL: 'Other news websites or blogs'
        //     }
        // },
        // {
        //     email_address: 'fadekemiajayi13@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: 'Ajayi Fadekemi', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: 'test@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: 'sundayomonusi@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'sunshining', CHANNEL: '' }
        // },
        // {
        //     email_address: 'florenceogbonna80@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Nzube',
        //         CHANNEL: 'Other news websites or blogs'
        //     }
        // },
        // {
        //     email_address: 'testprod3@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: 'bovkolawole@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Kolawole Oluwanifemi',
        //         UNAME: 'Oluwanifemi',
        //         CHANNEL: 'Twitter, Instagram, etc.'
        //     }
        // },
        // {
        //     email_address: 'ezinno1979@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Innocent Eze Chima',
        //         UNAME: 'Flimzy',
        //         CHANNEL: 'From a friend'
        //     }
        // },
        // {
        //     email_address: 'abdulrazaqokesanya@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Abdulrazaq okesanya',
        //         UNAME: 'Abdulrazaq234',
        //         CHANNEL: 'None of the above'
        //     }
        // },
        // {
        //     email_address: 'blessingizukamma@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Blessing',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'andy1213341422@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'AndyB', CHANNEL: 'Evi Finance Blog' }
        // },
        // {
        //     email_address: 'curtisanthony1991@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Curtis Anthony',
        //         UNAME: 'Curtisanthony1991',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'mixerstandard2@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'Stephen', CHANNEL: 'From a friend' }
        // },
        // {
        //     email_address: '2cmoneydami@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'Dami247', CHANNEL: 'Evi Finance Blog' }
        // },
        // {
        //     email_address: 'osatoyinbotemitope8673@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'osatoyinbo temitooe',
        //         UNAME: 'Osatoyinbo',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'basseynse377@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Nse Bassey',
        //         UNAME: 'Dmulla1',
        //         CHANNEL: 'From paid advertisements'
        //     }
        // },
        // {
        //     email_address: 'testprod@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'Tesr', CHANNEL: '' }
        // },
        // {
        //     email_address: 'davidakor24@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Papblow',
        //         CHANNEL: 'Other news websites or blogs'
        //     }
        // },
        // {
        //     email_address: 'Kharroe@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Karo',
        //         CHANNEL: 'Other news websites or blogs'
        //     }
        // },
        // {
        //     email_address: 'eruwulse@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Paul Emmanuel',
        //         UNAME: 'Eruskkii',
        //         CHANNEL: 'None of the above'
        //     }
        // },
        // {
        //     email_address: 'crisbyolu@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: 'Christy Olu', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: 'testprod3@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Tester',
        //         CHANNEL: 'Twitter, Instagram, etc.'
        //     }
        // },
        // {
        //     email_address: 'testprod4@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Tester4',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'elizabethylan86@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'Chigoflex', CHANNEL: 'Evi Finance Blog' }
        // },
        // {
        //     email_address: 'clemo8me@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Clemo Emm',
        //         UNAME: 'Clems',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'anagapromise354@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Promzy',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },  
        // {
        //     email_address: 'omiwaleopeyemi31@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Omiwale Opeyemi',
        //         UNAME: 'Bravomrm22022',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'comwordpress11@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Wordpress Com',
        //         UNAME: 'Classjan',
        //         CHANNEL: 'From a friend'
        //     }
        // },
        // {
        //     email_address: 'joyade25@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Ade Joy',
        //         UNAME: 'Adepos',
        //         CHANNEL: 'Twitter, Instagram, etc.'
        //     }
        // },
        // {
        //     email_address: 'anayochukwugozie@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: 'Philip Odimegwu', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: 'lawalabdu99@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: 'Abdu Lawal', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: 'cnxplaystore542@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Cnxplaystore',
        //         UNAME: 'John',
        //         CHANNEL: 'Evi Finance Blog'
        //     }
        // },
        // {
        //     email_address: 'ojodeborah112@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Deborah Ojo',
        //         UNAME: 'Debbie',
        //         CHANNEL: 'Evi Finance Blog'
        //     }
        // },
        // {
        //     email_address: 'obkaro@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Oghenekaro Obrutu',
        //         UNAME: 'Karo',
        //         CHANNEL: 'Other news websites or blogs'
        //     }
        // },
        // {
        //     email_address: 'testprod14@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Aaron',
        //         CHANNEL: 'Other news websites or blogs'
        //     }
        // },
        // {
        //     email_address: 'testprod1@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: 'testg4@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Amanda',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'pyarrapvc@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Victor Pyarrap',
        //         UNAME: 'Pyarrap',
        //         CHANNEL: 'Twitter, Instagram, etc.'
        //     }
        // },
        // {
        //     email_address: 'testa321@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'Ella', CHANNEL: 'Evi Finance Blog' }
        // },
        // {
        //     email_address: 'testprod44@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Andy',
        //         CHANNEL: 'Twitter, Instagram, etc.'
        //     }
        // },
        // {
        //     email_address: 'testprod6@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: 'guruchidi@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'Guruchidi', CHANNEL: 'From a friend' }
        // },
        // {
        //     email_address: 'hello@evi.ng',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Karo',
        //         CHANNEL: 'Other news websites or blogs'
        //     }
        // },
        // {
        //     email_address: 'test74@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Abike',
        //         CHANNEL: 'Other news websites or blogs'
        //     }
        // },
        // {
        //     email_address: 'tamunotonyerose01@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Rose Tamunotonye',
        //         UNAME: 'Rose',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'testprod7@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: 'raphaelmondayjohn@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Raphaelbolous',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'test123@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Filomena',
        //         CHANNEL: 'Other news websites or blogs'
        //     }
        // },
        // {
        //     email_address: 'mugupet868@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Damipe',
        //         CHANNEL: 'Other news websites or blogs'
        //     }
        // },
        // {
        //     email_address: '5198tech@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'Tee', CHANNEL: 'From a friend' }
        // },
        // {
        //     email_address: 'garri2314@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Garrium Oluwani',
        //         UNAME: 'Garriful',
        //         CHANNEL: 'From a friends'
        //     }
        // },
        // {
        //     email_address: 'contactinfojsmgr2133@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'Jackson', CHANNEL: 'None of the above' }
        // },
        // {
        //     email_address: 'mb042604@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Mark Bella',
        //         UNAME: 'Mark',
        //         CHANNEL: 'From paid advertisements'
        //     }
        // },
        // {
        //     email_address: 'misomareginald03@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Internationalman',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'ioseph.mazziotti@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: 'Joseph Mazziotti', UNAME: '', CHANNEL: '' }
        // },
        // {
        //     email_address: 'banjycoal@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Banjycoal orlarbanjy',
        //         UNAME: 'Banjycoal',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'olamilekanly66@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: 'Olamilekan Adeleke',
        //         UNAME: 'Kodx',
        //         CHANNEL: 'Google or other search engines'
        //     }
        // },
        // {
        //     email_address: 'jacksonadams605@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: {
        //         FULLNAME: '',
        //         UNAME: 'Jackson1988',
        //         CHANNEL: 'None of the above'
        //     }
        // },
        // {
        //     email_address: 'realahmedmass@gmail.com',
        //     status: 'subscribed',
        //     merge_fields: { FULLNAME: '', UNAME: 'Mass5050', CHANNEL: 'From a friend' }
        // }
        //      ]
        // });
        // functions.logger.log(response);




        // const run = async () => {
        //     const response = await client.lists.addListMember("6704dd2600", {
        //         email_address: "eruwulse@gmail.com",
        //         status: "subscribed",
        //         merge_fields: {
        //             // FNAME: "Asampd",
        //             // LNAME: "Oni",
        //             FULLNAME: "Asampd Oni",
        //             UNAME: "asampd",
        //             CHANNEL: "youtube",
        //         }
        //     });
        //     console.log(response);
        // };



        return null;
    });